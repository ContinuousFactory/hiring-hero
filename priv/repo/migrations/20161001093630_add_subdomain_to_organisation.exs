defmodule Hiringhero.Repo.Migrations.AddSubdomainToOrganisation do
  use Ecto.Migration

  def change do
    alter table(:organisations) do
      add :subdomain, :string
    end

    create index(:organisations, [:subdomain])
  end
end
