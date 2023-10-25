defmodule HelloWorldWeb.PostHTML do
  use HelloWorldWeb, :html

  embed_templates "post_html/*"

  @doc """
  Renders a post form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :script_src_nonce, :string

  def post_form(assigns)
end
