defmodule Lift.Repo.Migrations.CreateSets do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :weight, :float
      add :reps, :integer

      timestamps()
    end

  end
end
