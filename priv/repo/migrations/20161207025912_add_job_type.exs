defmodule Hiringhero.Repo.Migrations.AddJobType do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :type, :string
    end
  end
end
