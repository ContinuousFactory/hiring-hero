defmodule Hiringhero.UserController do
  use Hiringhero.Web, :controller
  Coherence.Authentication.Session

  alias Hiringhero.User

  plug :load_and_authorize_resource, model: Hiringhero.User

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
        |> redirect(to: user_path(conn, :edit, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    Repo.delete!(user)

    conn
    |> put_flash(:info, "Member deleted successfully.")
    |> redirect(to: interviewee_path(conn, :index))
  end
end
