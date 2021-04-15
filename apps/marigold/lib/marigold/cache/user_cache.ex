defmodule Cache.UserCache do
  use GenServer

  @impl true
  def init(:ok) do
    Enum.map(Jason.decode!(Processor.RequestProcessor.get!("/users/").body), &add/1)
    {:ok, %{}}
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def add(user) do
    GenServer.cast(UserCache, {:add, user})
  end

  def get(user) do
    GenServer.call(UserCache, {:get, user})
  end

  def get() do
    GenServer.call(UserCache, :get)
  end

  @impl true
  def handle_call(msg, _from, state) do
    case msg do
      :get ->
        {:reply, state, state}

      {:get, user} ->
        {:reply, Map.get(state, user), state}

      _ ->
        {:reply, :error, state}
    end
  end

  @impl true
  def handle_cast(msg, state) do
    case msg do
      {:add, user} ->
        {:noreply, add_user(state, user)}

      _ ->
        {:noreply, state}
    end
  end

  defp add_user(state, user) do
    Map.put(state, user["username"], user)
  end
end
