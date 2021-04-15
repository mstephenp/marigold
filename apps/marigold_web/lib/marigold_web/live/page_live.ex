defmodule MarigoldWeb.PageLive do
  use MarigoldWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{}, search_result: "")}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query, search_result: "")}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      user ->
        [u1] = user
        email = Marigold.get_email(u1)
        {:noreply, assign(socket, query: query, search_result: "#{user} : #{email}")}
    end
  end

  defp search(query) do

    for user <- Marigold.get_users, String.starts_with?(user, query) do
      user
    end

    # if not MarigoldWeb.Endpoint.config(:code_reloader) do
    #   raise "action disabled when not in development"
    # end

    # for {app, desc, vsn} <- Application.started_applications(),
    #     app = to_string(app),
    #     String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
    #     into: %{},
    #     do: {app, vsn}
  end
end
