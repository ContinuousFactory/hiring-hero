defmodule Api.CompanyView do
  use Hiringhero.Web, :view

  def render("index.json", %{company: company}) do
    %{
      name: company.name,
      logo: logo_for(company),
      subdomain: company.subdomain,
      jobs: Enum.map(company.jobs, &job_json/1)
    }
  end

  def logo_for(company) do
    Enum.join(["http://localhost:4000/", Hiringhero.Logo.url({company.logo, company})], "")
  end

  def job_json(job) do
    %{
      id: job.id,
      title: job.title,
      description: job.description
    }
  end
end
