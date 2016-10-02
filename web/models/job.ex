defmodule Hiringhero.Job do
  use Hiringhero.Web, :model

  schema "jobs" do
    field :title, :string
    field :description, :string

    belongs_to :organisation, Organisation

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :organisation_id])
    |> validate_required([:title, :description, :organisation_id])
  end
end
