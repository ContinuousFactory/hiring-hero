defmodule Hiringhero.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :string, size: 65536
      
      timestamps()
    end

  end
end
