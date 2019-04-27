defmodule Lift.WorkoutsTest do
  use Lift.DataCase

  alias Lift.Workouts

  describe "exercises" do
    alias Lift.Workouts.Exercise

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def exercise_fixture(attrs \\ %{}) do
      {:ok, exercise} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workouts.create_exercise()

      exercise
    end

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Workouts.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Workouts.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      assert {:ok, %Exercise{} = exercise} = Workouts.create_exercise(@valid_attrs)
      assert exercise.title == "some title"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{} = exercise} = Workouts.update_exercise(exercise, @update_attrs)
      assert exercise.title == "some updated title"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_exercise(exercise, @invalid_attrs)
      assert exercise == Workouts.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Workouts.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Workouts.change_exercise(exercise)
    end
  end

  describe "sets" do
    alias Lift.Workouts.Set

    @valid_attrs %{reps: 42, weight: 120.5}
    @update_attrs %{reps: 43, weight: 456.7}
    @invalid_attrs %{reps: nil, weight: nil}

    def set_fixture(attrs \\ %{}) do
      {:ok, set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workouts.create_set()

      set
    end

    test "list_sets/0 returns all sets" do
      set = set_fixture()
      assert Workouts.list_sets() == [set]
    end

    test "get_set!/1 returns the set with given id" do
      set = set_fixture()
      assert Workouts.get_set!(set.id) == set
    end

    test "create_set/1 with valid data creates a set" do
      assert {:ok, %Set{} = set} = Workouts.create_set(@valid_attrs)
      assert set.reps == 42
      assert set.weight == 120.5
    end

    test "create_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_set(@invalid_attrs)
    end

    test "update_set/2 with valid data updates the set" do
      set = set_fixture()
      assert {:ok, %Set{} = set} = Workouts.update_set(set, @update_attrs)
      assert set.reps == 43
      assert set.weight == 456.7
    end

    test "update_set/2 with invalid data returns error changeset" do
      set = set_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_set(set, @invalid_attrs)
      assert set == Workouts.get_set!(set.id)
    end

    test "delete_set/1 deletes the set" do
      set = set_fixture()
      assert {:ok, %Set{}} = Workouts.delete_set(set)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_set!(set.id) end
    end

    test "change_set/1 returns a set changeset" do
      set = set_fixture()
      assert %Ecto.Changeset{} = Workouts.change_set(set)
    end
  end
end
