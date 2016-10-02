defmodule Hiringhero.Job do
  use Hiringhero.Web, :model
  alias Hiringhero.Repo

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
end
