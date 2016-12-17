defmodule Hiringhero.Router do
  use Hiringhero.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
    plug Hiringhero.Subdomain
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", as: :api do
    pipe_through :api
    get "/companies/:subdomain", Api.CompanyController, :index
    post "/companies/:company_id/jobs/:job_id/candidates", Api.CandidateController, :create
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Hiringhero do
    pipe_through :browser

    get "/", PageController, :landing

    get "/companies/:subdomain", CompanyController, :index
    get "/companies/:subdomain/jobs/:id", CompanyController, :index
  end

  scope "/app/", Hiringhero do
    pipe_through :protected

    resources "/users", UserController
    resources "/candidates", CandidateController
    resources "/stages", StageController

    get "/", PageController, :dashboard

    get "/interviewees", IntervieweeController, :index
    post "/inverviewees/invite", IntervieweeController, :invite
    delete "/inverviewees/invite", IntervieweeController, :invite

    resources "companies", CompanyController, only: [] do
      resources "events", EventController
    end

    resources "/jobs", JobController
  end
end
