defmodule Hiringhero.IntervieweeController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.Repo

  def index(conn, _params) do
    current_user = conn.assigns.current_user
    current_user = Repo.preload(current_user, [:my_organisation])
    current_organisation = current_user.my_organisation
    current_organisation = Repo.preload(current_organisation, [:members])
    interviewees = current_organisation.members
    render conn, "index.html", interviewees: interviewees, current_organisation: current_organisation
  end
end
