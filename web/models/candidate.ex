defmodule Hiringhero.Candidate do
  use Hiringhero.Web, :model

  schema "candidates" do
    field :name, :string
    field :email, :string
    field :status, :string
    field :summary, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> init_status
    |> cast(params, [:name, :email, :status, :summary])
    |> validate_required([:name, :email, :status, :summary])
  end

  defp init_status(struct) do
    %{ struct | status: "pending" }
  end
end
