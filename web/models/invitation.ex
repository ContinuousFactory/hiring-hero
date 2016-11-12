defmodule Coherence.Invitation do
  use Coherence.Web, :model

  schema "invitations" do
    field :name, :string
    field :email, :string
    field :token, :string
    field :organisation_id, :integer

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(name email token organisation_id))
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end
end
