defmodule Processor.RequestProcessor do

  use HTTPoison.Base

  @endpoint "https://jsonplaceholder.typicode.com"
  @token "123abc"

  @impl true
  def process_url(url) do
    @endpoint <> url
  end

  @impl true
  def process_request_headers(_) do
    [Authorization: "Bearer #{@token}", Accept: "Application/json; Charset=utf-8"]
  end

end
