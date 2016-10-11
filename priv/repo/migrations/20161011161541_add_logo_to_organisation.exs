defmodule Hiringhero.Repo.Migrations.AddLogoToOrganisation do
  use Ecto.Migration

  def change do
    alter table(:organisations) do
      add :logo, :string
    end
  end
end
