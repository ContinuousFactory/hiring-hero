defmodule Hiringhero.Stage do
  use Hiringhero.Web, :model

  schema "stages" do
    field :name, :string
    field :description, :string
    field :organisation_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :organisation_id])
    |> validate_required([:name, :description, :organisation_id])
  end
end
