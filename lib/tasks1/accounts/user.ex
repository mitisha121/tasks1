defmodule Tasks1.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Accounts.User
  alias Tasks1.Accounts.Manager


  schema "users" do
    field :name, :string

    has_many :managee_managers, Manager, foreign_key: :managee_id
    has_one :manager_managers, Manager, foreign_key: :manager_id

    #Attribution Class notes.
    #to get all the managees(who the user manages), we get the list of
    #managees where we are the manager. For each of those, our managee 
    #is the managee
    has_many :managees, through: [:manager_managers, :managee]
    has_one :managerr, through: [:managee_managers, :manager]
    

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
