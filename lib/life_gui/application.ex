defmodule LifeGui.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LifeGuiWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:life_gui, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LifeGui.PubSub},
      # Start a worker by calling: LifeGui.Worker.start_link(arg)
      # {LifeGui.Worker, arg},
      # Start to serve requests, typically the last entry
      LifeGuiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LifeGui.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LifeGuiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
