defmodule Hiringhero.Repo.Migrations.CreateOrganisation do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add :name, :string

      timestamps()
    end

  end
end
