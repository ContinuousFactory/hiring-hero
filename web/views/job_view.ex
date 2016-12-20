defmodule Hiringhero.JobView do
  use Hiringhero.Web, :view

  def candidates_count_for(job) do
    Enum.count(job.candidates)
  end
end
