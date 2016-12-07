defmodule Hiringhero.Candidate do
  use Hiringhero.Web, :model
  use Arc.Ecto.Schema

  alias Hiringhero.Job
  alias Hiringhero.Organisation
  alias Hiringhero.Candidate

  schema "candidates" do
    field :name, :string
    field :email, :string
    field :status, :string
    field :summary, :string
    field :document, Hiringhero.Document.Type

    belongs_to :job, Job
    belongs_to :organisation, Organisation

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> init_status
    |> cast(params, [:name, :email, :status, :summary, :job_id, :organisation_id])
    |> cast_attachments(params, [:document])
    |> validate_required([:name, :email, :status, :job_id, :organisation_id])
  end

  defp init_status(struct) do
    %{struct | status: "pending"}
  end

  def with_org(organisation_id) do
    from c in Candidate,
      where: c.organisation_id == ^organisation_id,
      select: c
  end
end
