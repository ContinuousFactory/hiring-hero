defmodule Hiringhero.Job do
  use Hiringhero.Web, :model
  alias Hiringhero.Repo
  alias Hiringhero.Job
  alias Hiringhero.Candidate

  schema "jobs" do
    field :title, :string
    field :description, :string

    has_many :candidates, Candidate

    belongs_to :organisation, Organisation

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :organisation_id])
    |> validate_required([:title, :description, :organisation_id])
  end

  def with_org(organisation_id) do
    from c in Job,
      where: c.organisation_id == ^organisation_id,
      select: c
  end
end
