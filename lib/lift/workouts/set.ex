defmodule Lift.Workouts.Set do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lift.Workouts.Exercise

  schema "sets" do
    field :reps, :integer
    field :weight, :float
    belongs_to :exercise, Exercise

    timestamps()
  end

  @doc false
  def changeset(set, attrs) do
    set
    |> cast(attrs, [:weight, :reps])
    |> validate_required([:weight, :reps])
  end
end
