defmodule Hiringhero.IntervieweeController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.{Repo, User}

  import Coherence.InvitationController, only: [create: 2]

  # plug :load_core_info when action in [:index, :invite]

  def index(conn, _params) do
    current_organisation = conn.assigns.current_organisation

    if current_organisation do
      current_organisation = Repo.preload(current_organisation, [:owner, :members])
      interviewees = current_organisation.members
    else
      current_user = conn.assigns.current_user
      current_user = Repo.preload(current_user, [organisation: :members])
      interviewees = current_user.organisation.members
    end

    render conn, "index.html", interviewees: interviewees, current_organisation: current_organisation
  end

  def invite(conn, %{ "email" => email, "name" => name }) do
    resource = Repo.get_by(User, email: email)

    # Check if already invite
    invite = Repo.get_by(Coherence.Invitation, email: email)

    if !is_nil(invite) do
      conn
      |> put_flash(:error, "Already invited.")
      |> redirect(to: interviewee_path(conn, :index))
    end

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
                                      "name" => name,
                                      "organisation_id" => conn.assigns.current_organisation.id }})
    end
  end
end
