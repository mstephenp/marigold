defmodule Marigold.MarigoldTest do

  use ExUnit.Case
  doctest Marigold

  test "get email for user" do
    user = "Antonette"
    email = Marigold.get_email(user)

    assert email == "Shanna@melissa.tv"
  end

  test "get users" do
    users = Marigold.get_users()

    assert length(users) > 0
  end

  test "get emails" do
    emails = Marigold.get_emails()

    assert length(emails) > 0
  end

  test "get users and emails" do
    users_and_emails = Marigold.get_users_and_emails()

    assert length(users_and_emails) > 0
  end


end
