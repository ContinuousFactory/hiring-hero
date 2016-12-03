defmodule Hiringhero.CompanyController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Organisation, Repo}

  def index(conn, %{"subdomain" => subdomain}) do
    org = Repo.get_by(Organisation, subdomain: subdomain)

    if is_nil(org) do
      text conn, "Company not found."
    else
      conn
      |> put_layout("public.html")
      |> render("index.html", org: org)
    end
  end
end
