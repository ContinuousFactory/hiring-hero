defmodule Hiringhero.StageController do
  use Hiringhero.Web, :controller

  alias Hiringhero.Stage

  def index(conn, _params) do
    stages = Repo.all(Stage.with_org(conn.assigns.current_organisation.id))
    render(conn, "index.html", stages: stages)
  end

  def new(conn, _params) do
    changeset = Stage.changeset(%Stage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stage" => stage_params}) do
    stage_params = Map.merge(stage_params, %{"organisation_id" => conn.assigns.current_organisation.id})
    changeset = Stage.changeset(%Stage{}, stage_params)

    case Repo.insert(changeset) do
      {:ok, _stage} ->
        conn
        |> put_flash(:info, "Stage created successfully.")
        |> redirect(to: stage_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    stage = Repo.get!(Stage, id)
    render(conn, "show.html", stage: stage)
  end

  def edit(conn, %{"id" => id}) do
    stage = Repo.get!(Stage, id)
    changeset = Stage.changeset(stage)
    render(conn, "edit.html", stage: stage, changeset: changeset)
  end

  def update(conn, %{"id" => id, "stage" => stage_params}) do
    stage = Repo.get!(Stage, id)
    changeset = Stage.changeset(stage, stage_params)

    case Repo.update(changeset) do
      {:ok, stage} ->
        conn
        |> put_flash(:info, "Stage updated successfully.")
        |> redirect(to: stage_path(conn, :show, stage))
      {:error, changeset} ->
        render(conn, "edit.html", stage: stage, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    stage = Repo.get!(Stage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(stage)

    conn
    |> put_flash(:info, "Stage deleted successfully.")
    |> redirect(to: stage_path(conn, :index))
  end
end
