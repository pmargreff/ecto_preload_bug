defmodule PreloadBugs.Repo do
  use Ecto.Repo,
    otp_app: :preload_bugs,
    adapter: Ecto.Adapters.Postgres
end
