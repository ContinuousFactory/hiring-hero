defmodule Hiringhero.Repo.Migrations.AddOrganisationIdToJob do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :organisation_id, :integer
    end

    create index(:jobs, [:organisation_id])
  end
end
