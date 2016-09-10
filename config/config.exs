# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hiringhero,
  ecto_repos: [Hiringhero.Repo]

# Configures the endpoint
config :hiringhero, Hiringhero.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZhsDc61fTL9SFjzJviLT+E/rwJaowB+AOkIzPCsjTIJ2K27T3EADBPyI6NmQeMah",
  render_errors: [view: Hiringhero.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hiringhero.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
