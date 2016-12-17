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
    model
    |> cast(params, [:title, :description, :happen_at, :priority])
    |> cast_assoc(:organisation)
    |> validate_required([:title])
  end
end
