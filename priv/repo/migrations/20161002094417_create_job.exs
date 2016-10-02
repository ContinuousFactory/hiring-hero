defmodule Hiringhero.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
