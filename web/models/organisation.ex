defmodule Hiringhero.Organisation do
  use Hiringhero.Web, :model
  alias Hiringhero.User
  alias Hiringhero.Job
  alias Hiringhero.Stage
  use Arc.Ecto.Schema

  schema "organisations" do
    field :name, :string
    field :subdomain, :string
    field :logo, Hiringhero.Document.Type

    has_many :members, User
    has_many :jobs, Job
    has_many :stages, Stage

    belongs_to :owner, User

    timestamps
  end

  def changeset(organisation, params \\ %{}) do
    params = set_subdomain(params)

    organisation
    |> cast(params, [:name, :subdomain, :owner_id])
    |> cast_attachments(params, [:logo])
    |> validate_required([:name, :subdomain])
  end

  defp set_subdomain(params) do
    if Map.has_key?(%{}, :name) do
      subdomain = params.name
                  |> String.downcase
                  |> String.replace(" ", "")

      Map.merge(params, %{subdomain: subdomain})
    else
      params
    end
  end
end
