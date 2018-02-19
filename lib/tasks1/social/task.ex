defmodule Tasks1.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string, null: false
    field :time, :integer, default: 0, null: false
    field :title, :string, null: false
    belongs_to :assignedTo, Tasks1.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :time, :assignedTo_id])
    |> validate_required([:title, :desc, :completed, :time, :assignedTo_id])
  end
end
