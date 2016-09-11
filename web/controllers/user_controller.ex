defmodule Hiringhero.UserController do
  use Hiringhero.Web, :controller
  alias Hiringhero.User

  Coherence.Authentication.Session, protected: true

  def index(conn, _params) do
    users = Repo.all(Hiringhero.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Hiringhero.User, id)
    render conn, "show.html", user: user
  end
end
