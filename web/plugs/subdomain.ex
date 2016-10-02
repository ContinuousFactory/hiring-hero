require IEx

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
    IEx.pry
    assign(conn, :subdomain, org.subdomain)
    conn = %{conn | request_path: "/#{org.subdomain}#{conn.request_path}"}
    conn
  end
end
