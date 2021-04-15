defmodule Marigold.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Marigold.PubSub},
      {Cache.UserCache, name: UserCache}
      # Start a worker by calling: Marigold.Worker.start_link(arg)
      # {Marigold.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Marigold.Supervisor)
  end
end
