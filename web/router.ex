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

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", ComSubdomain do
    pipe_through :browser
  end

  scope "/", Hiringhero do
    pipe_through :protected

    resources "/users", UserController
    resources "/candidates", CandidateController
    resources "/stages", StageController

    get "/", PageController, :dashboard
    get "/calendar", PageController, :calendar

    get "/interviewees", IntervieweeController, :index
    post "/inverviewees/invite", IntervieweeController, :invite
    delete "/inverviewees/invite", IntervieweeController, :invite

    resources "/jobs", JobController
  end
end
