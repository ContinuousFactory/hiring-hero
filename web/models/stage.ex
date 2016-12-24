defmodule Hiringhero.Stage do
  use Hiringhero.Web, :model

  alias Hiringhero.Repo
  alias Hiringhero.{Organisation, Stage, Candidate}

  schema "stages" do
    field :name, :string
    field :description, :string
    field :position, :integer

    has_many :candidates, Candidate
    belongs_to :organisation, Organisation

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :position, :organisation_id])
    |> validate_required([:name, :description, :position, :organisation_id])
  end

  def with_org(organisation_id) do
    from s in Stage,
      where: s.organisation_id == ^organisation_id,
      select: s
  end

  def first_stage(organisation_id) do
    Repo.get_by(Stage, position: 0, organisation_id: organisation_id)
  end
end
