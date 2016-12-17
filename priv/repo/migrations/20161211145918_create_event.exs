defmodule Hiringhero.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :priority, :string
      add :happen_at, :datetime
      add :organisation_id, :integer
      add :description, :string, size: 65536

      timestamps()
    end

  end
end
