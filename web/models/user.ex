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
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> cast_assoc(:my_organisation)
    |> validate_required([:name, :email])
    |> validate_coherence(params)
  end
end
