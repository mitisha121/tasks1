defmodule Tasks1.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :desc, :text, null: false
      add :completed, :boolean, default: false, null: false
      add :time, :integer, default: 0, null: false
      add :assignedTo_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:tasks, [:assignedTo_id])
  end
end
