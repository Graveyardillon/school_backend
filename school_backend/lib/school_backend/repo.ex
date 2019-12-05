defmodule SchoolBackend.Repo do
  use Ecto.Repo,
    otp_app: :school_backend,
    adapter: Ecto.Adapters.Postgres
end
