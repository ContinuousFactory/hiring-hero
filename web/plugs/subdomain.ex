defmodule Hiringhero.Subdomain do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do conn
    user = conn.assigns.current_user
    user = Hiringhero.Repo.preload(user, [:my_organisation, :organisation])
    if user.my_organisation do
      org = user.my_organisation
    else
      org = user.organisation
    end
    assign(conn, :subdomain, org.subdomain)
    assign(conn, :current_organisation, org)
  end
end
