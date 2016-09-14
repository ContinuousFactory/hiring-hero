defmodule Hiringhero.Repo.Migrations.AddDocumentToCandidate do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :document, :string
    end
  end
end
