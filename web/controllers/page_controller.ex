defmodule Hiringhero.PageController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  def calendar(conn, _params) do
    render conn, "calendar.html"
  end

  def dashboard(conn, _params) do
    render conn, "dashboard.html"
  end
end
