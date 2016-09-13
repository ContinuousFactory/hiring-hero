defmodule Hiringhero.Repo.Migrations.CreateCandidate do
  use Ecto.Migration

  def change do
    create table(:candidates) do
      add :name, :string
      add :email, :string
      add :status, :string
      add :summary, :string

      timestamps()
    end

  end
end
