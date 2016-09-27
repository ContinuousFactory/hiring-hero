defmodule Hiringhero.User do
  use Hiringhero.Web, :model
  use Coherence.Schema

  alias Hiringhero.Organisation

  schema "users" do
    field :name, :string
    field :email, :string
    belongs_to :organisation, Organisation
    has_one :my_organisation, Organisation, foreign_key: :owner_id

    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> Hiringhero.Repo.preload([:my_organisation])
    |> cast(params, [:name, :email, :organisation_id] ++ coherence_fields)
    |> cast_assoc(:my_organisation, require: true)
    |> validate_required([:name, :email])
    |> validate_coherence(params)
  end
end
