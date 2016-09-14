defmodule Hiringhero.Candidate do
  use Hiringhero.Web, :model
  use Arc.Ecto.Schema

  schema "candidates" do
    field :name, :string
    field :email, :string
    field :status, :string
    field :summary, :string
    field :document, Hiringhero.Document.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> init_status
    |> cast(params, [:name, :email, :status, :summary])
    |> cast_attachments(params, [:document])
    |> validate_required([:name, :email, :status, :summary])
  end

  defp init_status(struct) do
    %{ struct | status: "pending" }
  end
end
