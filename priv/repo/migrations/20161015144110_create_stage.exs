defmodule Hiringhero.Repo.Migrations.CreateStage do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      add :description, :string
      add :organisation_id, :integer

      timestamps()
    end
    
    create index(:stages, :organisation_id)
  end
end
