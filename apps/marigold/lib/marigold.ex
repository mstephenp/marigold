defmodule Marigold do

  def get_users() do
    Map.keys(Cache.UserCache.get)
  end

  def get_emails() do
    Enum.map(Map.values(Cache.UserCache.get), &(&1["email"]))
  end

  def get_email(user) do
    Cache.UserCache.get(user)["email"]
  end

  def get_users_and_emails() do
    Enum.zip(get_users(), get_emails())
  end
end
