defmodule Lift.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :title, :string

      timestamps()
    end

  end
end
