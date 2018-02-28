defmodule Tasks1.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :manager_id, references(:users, on_delete: :delete_all), null: false
      add :managee_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:managers, [:manager_id])
    create index(:managers, [:managee_id])
  end
end
