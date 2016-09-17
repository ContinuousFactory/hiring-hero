defmodule Hiringhero.Organisation do
  use Hiringhero.Web, :model

  schema "organisations" do
    field :name, :string
    has_many :users, User
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
