defmodule Hiringhero.Event do
  use Hiringhero.Web, :model

  alias Hiringhero.Organisation

  schema "events" do
    field :title, :string
    field :description, :string
    field :happen_at, Ecto.DateTime
    field :priority, :string
    belongs_to :organisation, Organisation

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    params = date_string_to_ecto_date(params)
    model
    |> cast(params, [:title, :description, :happen_at, :priority, :organisation_id])
    |> validate_required([:title, :happen_at, :organisation_id])
  end

  def date_string_to_ecto_date(params) do
    if Map.has_key?(params, "happen_at") do
      {:ok, time} = params["happen_at"] |> Timex.parse("{0M}/{0D}/{YYYY} {h12}:{m} {am}")
      ecto_time = time |> Ecto.DateTime.cast!
      %{params | "happen_at" => ecto_time }
    else
      params
    end
  end
end
