defmodule Hiringhero.Repo.Migrations.RemoveUsernameFromUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :username
    end
  end
end
