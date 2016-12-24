defmodule Hiringhero.Repo.Migrations.AddStateToCandidate do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :stage_id, :integer
    end

    create index(:candidates, :stage_id)
  end
end
