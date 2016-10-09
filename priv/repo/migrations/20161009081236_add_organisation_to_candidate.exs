defmodule Hiringhero.Repo.Migrations.AddOrganisationToCandidate do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :organisation_id, :integer
    end

    create index(:candidates, :organisation_id)
  end
end
