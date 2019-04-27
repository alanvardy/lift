defmodule LiftWeb.SetController do
  use LiftWeb, :controller

  alias Lift.Workouts
  alias Lift.Workouts.Set

  def index(conn, _params) do
    sets = Workouts.list_sets()
    render(conn, "index.html", sets: sets)
  end

  def new(conn, _params) do
    exercises = Workouts.list_exercises()
    changeset = Workouts.change_set(%Set{})
    render(conn, "new.html", changeset: changeset, exercises: exercises)
  end

  def create(conn, %{"set" => set_params}) do
    case Workouts.create_set(set_params) do
      {:ok, set} ->
        conn
        |> put_flash(:info, "Set created successfully.")
        |> redirect(to: Routes.set_path(conn, :show, set))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    set = Workouts.get_set!(id)
    render(conn, "show.html", set: set)
  end

  def edit(conn, %{"id" => id}) do
    set = Workouts.get_set!(id)
    changeset = Workouts.change_set(set)
    render(conn, "edit.html", set: set, changeset: changeset)
  end

  def update(conn, %{"id" => id, "set" => set_params}) do
    set = Workouts.get_set!(id)

    case Workouts.update_set(set, set_params) do
      {:ok, set} ->
        conn
        |> put_flash(:info, "Set updated successfully.")
        |> redirect(to: Routes.set_path(conn, :show, set))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", set: set, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    set = Workouts.get_set!(id)
    {:ok, _set} = Workouts.delete_set(set)

    conn
    |> put_flash(:info, "Set deleted successfully.")
    |> redirect(to: Routes.set_path(conn, :index))
  end
end
