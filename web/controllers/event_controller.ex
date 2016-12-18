defmodule Hiringhero.EventController do
  use Hiringhero.Web, :controller

  alias Hiringhero.{Event, Repo}

  def index(conn, _) do
    events = Repo.all(Event)
    conn
    |> render("index.html", events: events)
  end

  def new(conn, _) do
    changeset = Event.changeset(%Event{})
    conn
    |> render("new.html", changeset:  changeset)
  end

  def create(conn, %{"event" => event_params}) do
    event_params = Map.merge(event_params, %{"organisation_id" => conn.assigns.current_organisation.id})
    changeset = Event.changeset(%Event{}, event_params)

    case Repo.insert(changeset) do
      {:ok, _event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: company_event_path(conn, :index, conn.assigns.current_organisation))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)

    Repo.delete!(event)

    conn
    |> put_flash(:info, "Job deleted successfully.")
    |> redirect(to: company_event_path(conn, :index, conn.assigns.current_organisation))
  end
end
