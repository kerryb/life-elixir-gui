import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :life_gui, LifeGuiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bPxuGSk40+VVHeymDk1ZCk1mB1Evo4Y0sopYfiRW0wegW3NDhDrAe1b0A33dCkT0",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
