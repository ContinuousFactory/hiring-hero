defmodule Hiringhero.Stage do
  use Hiringhero.Web, :model

  alias Hiringhero.Organisation
  alias Hiringhero.Stage

  schema "stages" do
    field :name, :string
    field :description, :string

    belongs_to :organisation, Organisation

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :organisation_id])
    |> validate_required([:name, :description, :organisation_id])
  end

  def with_org(organisation_id) do
    from s in Stage,
      where: s.organisation_id == ^organisation_id,
      select: s
  end
end
