defmodule MyApp.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Content` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> MyApp.Content.create_message()

    message
  end
end
