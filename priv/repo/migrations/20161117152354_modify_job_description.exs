defmodule Hiringhero.Repo.Migrations.ModifyJobDescription do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      modify(:description, :string, size: 65536)
    end
  end
end
