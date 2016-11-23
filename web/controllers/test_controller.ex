defmodule Hiringhero.TestController do
  use Hiringhero.Web, :controller
  plug Coherence.Authentication.Session, [protected: true] when action == :index

  def index(conn, _) do
    render(conn, "index.html")
  end
end
