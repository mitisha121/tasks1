defmodule Tasks1.Social.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.Timeblock


  schema "timeblocks" do
    field :endTime, :time
    field :startTime, :time
    belongs_to :task, Tasks1.Social.Task

    timestamps()
  end

  @doc false
  def changeset(%Timeblock{} = timeblock, attrs) do
    timeblock
    |> cast(attrs, [:startTime, :endTime, :task_id])
    |> validate_required([:startTime, :endTime, :task_id])
  end
end
