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
    end

    if user.organisation do
      org = user.organisation
    end

    if org do
      conn = assign(conn, :subdomain, org.subdomain)
      conn = assign(conn, :current_organisation, org)
    end
    conn
  end
end
