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
    user = Repo.preload(user, :my_organisation)
    render conn, "show.html", user: user
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    user = Repo.preload(user, [:my_organisation])
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    user = Repo.preload(user, [:my_organisation])
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end
end
