defmodule Hiringhero.Organisation do
  use Hiringhero.Web, :model
  alias Hiringhero.User

  schema "organisations" do
    field :name, :string
    field :subdomain, :string

    has_many :members, User
    has_many :jobs, Job

    belongs_to :owner, User

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(organisation, params \\ %{}) do
    params = set_subdomain(params)

    organisation
    |> cast(params, [:name, :subdomain])
    |> validate_required([:name, :subdomain])
  end

  defp set_subdomain(params) do
    if params["name"] do
      subdomain = params["name"]
                  |> String.downcase
                  |> String.replace(" ", "")

      Map.merge(params, %{"subdomain" => subdomain})
    else
      params
    end
  end
end
