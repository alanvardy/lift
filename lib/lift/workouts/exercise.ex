defmodule Lift.Workouts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lift.Workouts.Set

  schema "exercises" do
    field :title, :string
    has_many :sets, Set

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
