defmodule Api.CompanyController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Organisation, Repo}

  def index(conn, %{"subdomain" => subdomain}) do
    company = Repo.get_by(Organisation, subdomain: subdomain)

    if is_nil(company) do
      json conn, %{"error" => "Company not found."}
    else
      company = Repo.preload(company, [:jobs])
      render conn, "index.json", company: company
    end
  end
end
