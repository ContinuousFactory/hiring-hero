defmodule Hiringhero.Candidate do
  use Hiringhero.Web, :model
  use Arc.Ecto.Schema

  alias Hiringhero.{Job, Organisation, Candidate, Stage}

  schema "candidates" do
    field :name, :string
    field :email, :string
    field :status, :string
    field :summary, :string
    field :document, Hiringhero.Document.Type

    belongs_to :job, Job
    belongs_to :organisation, Organisation
    belongs_to :stage, Stage

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> init_status
    |> init_stage
    |> cast(params, [:name, :email, :status, :summary, :job_id, :organisation_id, :stage_id])
    |> cast_attachments(params, [:document])
    |> validate_required([:name, :email, :status, :job_id, :organisation_id, :stage_id])
  end

  defp init_status(struct) do
    %{struct | status: "pending"}
  end

  defp init_stage(struct) do
    first_stage = Stage.first_stage(struct.organisation_id)
    %{struct | stage_id: first_stage.id}
  end

  def with_org(organisation_id) do
    from c in Candidate,
      where: c.organisation_id == ^organisation_id,
      select: c
  end
end
