defmodule LifeGuiWeb.IndexLive do
  use LifeGuiWeb, :live_view

  alias Life.Grid
  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    Process.send_after(self(), :tick, 100)
    {:ok, assign(socket, life: random_life())}
  end

  @impl LiveView
  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 100)
    {:noreply, update(socket, :life, &Life.tick/1)}
  end

  defp random_life do
    1..100
    |> Enum.map(fn _ -> {:rand.uniform(20), :rand.uniform(20)} end)
    |> Life.new()
  end
end
