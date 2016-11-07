defmodule Hiringhero.Repo.Migrations.AddOrganisationToInvitation do
  use Ecto.Migration

  def change do
    alter table(:invitations) do
      add(:organisation_id, :integer)
    end
  end
end
