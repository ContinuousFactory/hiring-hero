defmodule Hiringhero.Repo.Migrations.AddOwnerIdToOrganisation do
  use Ecto.Migration

  def change do
    alter table(:organisations) do
      add :owner_id, :integer
    end
  end
end
