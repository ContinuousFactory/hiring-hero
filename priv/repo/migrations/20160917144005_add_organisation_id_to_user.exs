defmodule Hiringhero.Repo.Migrations.AddOrganisationIdToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :organisation_id, :integer
    end
  end
end
