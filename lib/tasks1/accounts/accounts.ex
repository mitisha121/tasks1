defmodule Tasks1.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Tasks1.Repo

  alias Tasks1.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user(id), do: Repo.get(User, id)

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_name(name) do
    Repo.get_by(User, name: name)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def all_users() do
    Repo.all(User)
    |> Repo.preload()
  end

  def all_u() do
    Repo.all(User)
  end

  def current(user_id) do
    Repo.all(from m in User,
    where: m.id == ^user_id)
  end

  def not_current(user_id) do
    Repo.all(from m in User,
    where: m.id != ^user_id)
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Tasks1.Accounts.Manager

  @doc """
  Returns the list of managers.

  ## Examples

      iex> list_managers()
      [%Manager{}, ...]

  """
  def list_managers do
    Repo.all(Manager)
    |> Repo.preload(:manager)
    |> Repo.preload(:managee)
  end

  @doc """
  Gets a single manager.

  Raises `Ecto.NoResultsError` if the Manager does not exist.

  ## Examples

      iex> get_manager!(123)
      %Manager{}

      iex> get_manager!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manager!(id) do 
    Repo.get!(Manager, id)
    |> Repo.preload(:manager)
    |> Repo.preload(:managee)
  end


  def get_managerr(user_id) do
    Repo.all(from m in Manager,
      where: m.managee_id == ^user_id)
    |> Repo.preload(:manager)
  end

  def get_managee(user_id) do
    Repo.all(from m in Manager,
      where: m.manager_id == ^user_id)
    |> Repo.preload(:managee)
  end

  def all_managers() do
    Repo.all(Manager)
    |> Repo.preload(:manager)
  end

  def no_manager(user_id) do
    #managers = from m in Manager,
    #where: m.managee_id != ^user_id,
    #select: m.managee_id
    #managers = Tasks1.Accounts.all_managers()
    #users = Tasks1.Accounts.all_users()
    #users = from u in Tasks1.Accounts.User,
    #where: u.id != ^user_id,
    #select: u.id
    #IO.puts(users)
    #query = from m in Manager, where: m.managee_id != user_id, select: m.managee_id
    #Repo.all(from user in ^users,
    #  where: user not in ^managers)
    #|> Repo.preload()
  end

  @doc """
  Creates a manager.

  ## Examples

      iex> create_manager(%{field: value})
      {:ok, %Manager{}}

      iex> create_manager(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manager(attrs \\ %{}) do
    %Manager{}
    |> Manager.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manager.

  ## Examples

      iex> update_manager(manager, %{field: new_value})
      {:ok, %Manager{}}

      iex> update_manager(manager, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manager(%Manager{} = manager, attrs) do
    manager
    |> Manager.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Manager.

  ## Examples

      iex> delete_manager(manager)
      {:ok, %Manager{}}

      iex> delete_manager(manager)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manager(%Manager{} = manager) do
    Repo.delete(manager)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manager changes.

  ## Examples

      iex> change_manager(manager)
      %Ecto.Changeset{source: %Manager{}}

  """
  def change_manager(%Manager{} = manager) do
    Manager.changeset(manager, %{})
  end
end
