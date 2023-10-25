defmodule HelloWorld.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HelloWorld.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        title: "some title",
        views: 42
      })
      |> HelloWorld.Blog.create_post()

    post
  end
end
