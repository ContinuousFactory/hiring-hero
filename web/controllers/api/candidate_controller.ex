defmodule Api.CandidateController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Candidate, Repo}

  def create(conn, %{"resume" => resume_params, "company_id" => company_id, "job_id" => job_id}) do
    json conn, %{"msg" => "success!"}
  end
end
