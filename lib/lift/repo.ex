defmodule Lift.Repo do
  use Ecto.Repo,
    otp_app: :lift,
    adapter: Ecto.Adapters.Postgres
end
