defmodule Hiringhero.IntervieweeController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.Repo
  alias Hiringhero.User

  import Coherence.InvitationController, only: [create: 2]

  plug :load_core_info when action in [:index, :invite]

  def index(conn, _params) do
    if conn.assigns.current_organisation do
      interviewees = conn.assigns.current_organisation.members
    else
      current_user = conn.assigns.current_user
      current_user = Repo.preload(current_user, [:organisation])
      organisation = current_user.organisation
      organisation = Repo.preload(organisation, [:members])
      interviewees = organisation.members
    end
    render conn, "index.html", interviewees: interviewees, current_organisation: conn.assigns.current_organisation
  end

  def invite(conn, %{ "email" => email }) do
    resource = Repo.get_by(User, email: email)

    if resource do
      changeset = User.changeset(resource, %{
        organisation_id: conn.assigns.current_organisation.id
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
      |> create(%{"invitation" =>  %{ "email" => email,
                                      "name" => "NA",
                                      "organisation_id" => conn.assigns.current_organisation.id }})
    end
  end
end
