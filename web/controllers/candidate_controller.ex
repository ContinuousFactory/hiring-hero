defmodule Hiringhero.CandidateController do
  use Hiringhero.Web, :controller

  alias Hiringhero.Candidate

  def index(conn, _params) do
    candidates = Repo.all(Candidate)
    render(conn, "index.html", candidates: candidates)
  end

  def new(conn, _params) do
    changeset = Candidate.changeset(%Candidate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"candidate" => candidate_params}) do
    changeset = Candidate.changeset(%Candidate{}, candidate_params)

    case Repo.insert(changeset) do
      {:ok, _candidate} ->
        conn
        |> put_flash(:info, "Candidate created successfully.")
        |> redirect(to: candidate_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    candidate = Repo.get!(Candidate, id)
    render(conn, "show.html", candidate: candidate)
  end

  def edit(conn, %{"id" => id}) do
    candidate = Repo.get!(Candidate, id)
    changeset = Candidate.changeset(candidate)
    render(conn, "edit.html", candidate: candidate, changeset: changeset)
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

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(candidate)

    conn
    |> put_flash(:info, "Candidate deleted successfully.")
    |> redirect(to: candidate_path(conn, :index))
  end
end
