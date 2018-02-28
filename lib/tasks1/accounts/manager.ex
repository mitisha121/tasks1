defmodule Tasks1.Accounts.Manager do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Accounts.Manager


  schema "managers" do
  
    belongs_to :manager, Tasks1.Accounts.User
    belongs_to :managee, Tasks1.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Manager{} = manager, attrs) do
    manager
    |> cast(attrs, [:manager_id, :managee_id])
    |> validate_required([:manager_id, :managee_id])
  end
end
