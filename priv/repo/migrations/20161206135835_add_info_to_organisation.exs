defmodule Hiringhero.Repo.Migrations.AddInfoToOrganisation do
  use Ecto.Migration

  def change do
    alter table(:organisations) do
      add :website, :string
      add :description, :string, size: 65536
      add :linkedin, :string
      add :twitter, :string
      add :github, :string
      add :facebook, :string
      add :tagline, :string
    end
  end
end
