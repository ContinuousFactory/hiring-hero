defmodule Hiringhero.Repo.Migrations.AddMissingIndexes do
  use Ecto.Migration

  def change do
    create index(:users, [:organisation_id])
    create index(:organisations, [:owner_id])
  end
end
