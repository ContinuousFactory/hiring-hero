defmodule Hiringhero.Common do
  import Plug.Conn
  import Phoenix.Controller
  alias Hiringhero.Repo

  def load_core_info(conn, _opts) do
    current_user = conn.assigns.current_user
    current_user = Repo.preload(current_user, [:my_organisation])
    current_organisation = current_user.my_organisation
    current_organisation = Repo.preload(current_organisation, [:members])
    assign(conn, :current_organisation, current_organisation)
  end
end
