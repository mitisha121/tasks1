defmodule Tasks1Web.ManagerController do
  use Tasks1Web, :controller

  alias Tasks1.Accounts
  alias Tasks1.Accounts.Manager

  def index(conn, _params) do
    managers = Accounts.list_managers()
    current_user = conn.assigns[:current_user]        
    render(conn, "index.html", managers: managers, current_user: current_user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_manager(%Manager{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"manager" => manager_params}) do
    case Accounts.create_manager(manager_params) do
      {:ok, manager} ->
        conn
        |> put_flash(:info, "Manager created successfully.")
        |> redirect(to: manager_path(conn, :show, manager))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manager = Accounts.get_manager!(id)
    render(conn, "show.html", manager: manager)
  end

  def edit(conn, %{"id" => id}) do
    manager = Accounts.get_manager!(id)
    changeset = Accounts.change_manager(manager)
    render(conn, "edit.html", manager: manager, changeset: changeset)
  end

  def update(conn, %{"id" => id, "manager" => manager_params}) do
    manager = Accounts.get_manager!(id)

    case Accounts.update_manager(manager, manager_params) do
      {:ok, manager} ->
        conn
        |> put_flash(:info, "Manager updated successfully.")
        |> redirect(to: manager_path(conn, :show, manager))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", manager: manager, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manager = Accounts.get_manager!(id)
    {:ok, _manager} = Accounts.delete_manager(manager)

    conn
    |> put_flash(:info, "Manager deleted successfully.")
    |> redirect(to: manager_path(conn, :index))
  end
end
