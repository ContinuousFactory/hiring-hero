defmodule Hiringhero.CandidateView do
  use Hiringhero.Web, :view

  import Ecto.Query

  alias Hiringhero.{Repo, Job, Stage}

  def jobs_option_available(org_id) do
    jobs = Repo.all(
      from job in Job,
      where: job.organisation_id == ^org_id,
      select: [job.title, job.id]
    )

    Enum.reduce(jobs, [], fn(job, acc) ->
      acc ++ ["#{List.first(job)}": List.last(job)]
    end)
  end

  def candidates_data(candidates) do
    Enum.map(candidates, fn (candidate) ->
      %{
        name: candidate.name,
        email: candidate.email,
        status: candidate.status,
        summary: candidate.summary
      }
    end) |> Poison.encode!
  end

  def stages_data(org_id) do
    Enum.map(Repo.all(Stage.with_org(org_id)), fn (stage) ->
      %{
        name: stage.name,
        description: stage.description,
        position: stage.position
      }
    end) |> Poison.encode!
  end
end
