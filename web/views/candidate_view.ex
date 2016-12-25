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
end
