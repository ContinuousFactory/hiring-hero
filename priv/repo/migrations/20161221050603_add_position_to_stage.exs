defmodule Hiringhero.Repo.Migrations.AddPositionToStage do
  use Ecto.Migration

  def change do
    alter table(:stages) do
      add :position, :integer
    end
  end
end
