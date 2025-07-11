defmodule MyApp.ContentTest do
  use MyApp.DataCase

  alias MyApp.Content

  describe "messages" do
    alias MyApp.Content.Message

    import MyApp.ContentFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Content.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Content.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %Message{} = message} = Content.create_message(valid_attrs)
      assert message.title == "some title"
      assert message.body == "some body"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %Message{} = message} = Content.update_message(message, update_attrs)
      assert message.title == "some updated title"
      assert message.body == "some updated body"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_message(message, @invalid_attrs)
      assert message == Content.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Content.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Content.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Content.change_message(message)
    end
  end
end
