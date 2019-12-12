# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :school_backend,
  ecto_repos: [SchoolBackend.Repo]

# Configures the endpoint
config :school_backend, SchoolBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oBk9p7odm7Y/EapA+riSnfe+DA3Ry83N8jI6ZC55MGhlFQ/tUaKctN9Y4B4IbvtV",
  render_errors: [view: SchoolBackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SchoolBackend.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :guardian, Guardian.DB,
  repo: SchoolBackend.Repo,
  schema_name: "guardian_tokens",
  sweep_interval: 60 # default: 60 minutes

config :school_backend, Schoolbackend.Functions.Guardian,
  issuer: "school_backend",
  secret_key: "JhK9gdcJp75SmExiVGVPz/3qAX54XcM9P0iTk3g+IYjAzigM60mdevCOLUm0ufzI"