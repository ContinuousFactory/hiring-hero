defmodule Hiringhero.EventController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Event, Repo}

  def index(conn, _) do
    conn
    |> render("index.html")
  end
end
