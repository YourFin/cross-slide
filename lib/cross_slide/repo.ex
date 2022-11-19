defmodule CrossSlide.Repo do
  use Ecto.Repo,
    otp_app: :cross_slide,
    adapter: Ecto.Adapters.Postgres
end
