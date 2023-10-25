defmodule HelloWorld.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :country, :string
    field :title, :string
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :views, :country])
    |> validate_required([:title, :views, :country])
  end
end
