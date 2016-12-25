defmodule Hiringhero.CandidateController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Candidate, Stage}

  def index(conn, _params) do
    candidates = Repo.all(Candidate.with_org(conn.assigns.current_organisation.id))
    stages = Repo.all(Stage.with_org(conn.assigns.current_organisation.id))
    render(conn, "index.html", candidates: candidates, stages: stages)
  end

  def new(conn, _params) do
    candidate = %Candidate{}
    changeset = Candidate.changeset(%Candidate{})
    render(conn, "new.html",
      changeset: changeset,
      candidate: candidate,
      current_organisation: conn.assigns.current_organisation
    )
  end

  def create(conn, %{"candidate" => candidate_params}) do
    candidate_params = Map.merge(candidate_params, %{"organisation_id" => conn.assigns.current_organisation.id})
    changeset = Candidate.changeset(%Candidate{}, candidate_params)

    case Repo.insert(changeset) do
      {:ok, _candidate} ->
        conn
        |> put_flash(:info, "Candidate created successfully.")
        |> redirect(to: candidate_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", candidate: %Candidate{}, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    candidate = Repo.get!(Candidate, id)
    render(conn, "show.html", candidate: candidate)
  end

  def edit(conn, %{"id" => id}) do
    candidate = Repo.get!(Candidate, id)
    changeset = Candidate.changeset(candidate)
    render(conn, "edit.html",
      candidate: candidate,
      changeset: changeset,
      current_organisation: conn.assigns.current_organisation
    )
  end

  def update(conn, %{"id" => id, "candidate" => candidate_params}) do
    candidate = Repo.get!(Candidate, id)
    changeset = Candidate.changeset(candidate, candidate_params)

    case Repo.update(changeset) do
      {:ok, candidate} ->
        conn
        |> put_flash(:info, "Candidate updated successfully.")
        |> redirect(to: candidate_path(conn, :show, candidate))
      {:error, changeset} ->
        render(conn, "edit.html", candidate: candidate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    candidate = Repo.get!(Candidate, id)

    Repo.delete!(candidate)

    conn
    |> put_flash(:info, "Candidate deleted successfully.")
    |> redirect(to: candidate_path(conn, :index))
  end
end
