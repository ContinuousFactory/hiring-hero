defmodule Hiringhero.UserController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.User

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    user = Repo.preload(user, :organisation)
    render conn, "show.html", user: user
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end
end
