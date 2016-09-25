defmodule Hiringhero.Organisation do
  use Hiringhero.Web, :model
  alias Hiringhero.User

  schema "organisations" do
    field :name, :string
    has_many :members, User
    belongs_to :owner, User
    
    timestamps
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
