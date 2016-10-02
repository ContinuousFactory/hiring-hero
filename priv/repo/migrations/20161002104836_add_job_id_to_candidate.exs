defmodule Hiringhero.Repo.Migrations.AddJobIdToCandidate do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :job_id, :integer
    end

    create index(:candidates, :job_id)
  end
end
