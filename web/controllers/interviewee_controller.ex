defmodule Hiringhero.IntervieweeController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.Repo
  alias Hiringhero.User

  plug :load_core_info when action in [:index, :invite]

  def index(conn, _params) do
    interviewees = conn.assigns.current_organisation.members
    render conn, "index.html", interviewees: interviewees, current_organisation: conn.assigns.current_organisation
  end

  def invite(conn, %{ "email" => email }) do
    resource = Repo.get_by(User, email: email)

    if resource do
      changeset = User.changeset(resource, %{
        organisation_id: conn.assigns.current_organisation.id,
        name: resource.name,
        email: resource.email
      })

      case Repo.update(changeset) do
        {:ok, resource} ->
          conn
          |> put_flash(:info, "Interviewee invitation successfully.")
          |> redirect(to: interviewee_path(conn, :index))
        {:error, changeset} ->
          conn
          |> put_flash(:error, "Interviewee invitation failed.")
          |> redirect(to: interviewee_path(conn, :index))
      end
    else
      conn
      |> put_flash(:error, "Nothing happen.")
      |> redirect(to: interviewee_path(conn, :index))
    end
  end
end
