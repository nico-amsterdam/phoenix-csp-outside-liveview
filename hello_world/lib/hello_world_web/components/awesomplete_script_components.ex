defmodule HelloWorldWeb.AwesompleteScriptComponents do

  @moduledoc """
  Provides function components for the Awesomplete component,
  which provides autocomplete functionality.
  """

  use Phoenix.Component

  @doc """
  Wrapper for PhoenixFormAwesomplete.awesomplete_script.
  """
  attr :forField, :any, required: true, doc: "Phoenix.HTML.FormField struct or field name."
  attr :forForm, :any, default: nil, doc: "Phoenix.HTML.Form struct or form name. Not needed when FormField is used."
  attr :rest, :global,
    include: ~w(ajax assign autoFirst combobox convertInput convertResponse data descr descrSearch filter item label list loadall limit maxItems minChars multiple prepop replace sort url urlEnd value),
    doc: "the options for awesomplete_script."
  def autocomplete(%{forField: %Phoenix.HTML.FormField{}} = assigns) do
    ~H"""
    <%= PhoenixFormAwesomplete.awesomplete_script(@forField, @rest) %>
    """
  end

  def autocomplete(%{forForm: _form, forField: _field} = assigns) do
    ~H"""
    <%= PhoenixFormAwesomplete.awesomplete_script(@forForm, @forField, @rest) %>
    """
  end

  @doc """
  Wrapper for PhoenixFormAwesomplete.copy_value_to_id.
  """
  attr :field, :any, required: true, doc: "Phoenix.HTML.FormField struct or field name."
  attr :form, :any, default: nil, doc: "Phoenix.HTML.Form struct or form name. Not needed when FormField is used."
  attr :dataField, :string, default: nil, doc: "Optional, dataField to be copied, for example: capital"
  attr :target, :string, doc: "css selector, for example: #capital"
  attr :rest, :global, doc: "script attributes."
  def copy_value_to_id(%{field: %Phoenix.HTML.FormField{}} = assigns) do
    ~H"""
    <%= PhoenixFormAwesomplete.copy_value_to_id_script(@field, @dataField, @target, @rest) %>
    """
  end

  def copy_value_to_id(%{form: _form, field: _field} = assigns) do
    ~H"""
    <%= PhoenixFormAwesomplete.copy_to_id_script(@form, @field, @dataField, @target, @rest) %>
    """
  end

  @doc """
  Wrapper for PhoenixFormAwesomplete.copy_value_to_field.
  """
  attr :sourceField, Phoenix.HTML.FormField, required: true,
    doc: "a Phoenix.HTML.FormField struct retrieved from the form, for example: @f[:country]"
  attr :targetField, Phoenix.HTML.FormField, required: true,
    doc: "a Phoenix.HTML.FormField struct retrieved from the form, for example: @f[:capital]"
  attr :dataField, :string, default: nil, doc: "Optional, dataField to be copied, for example: capital"
  attr :rest, :global, doc: "script attributes."
  def copy_value_to_field(%{sourceField: %Phoenix.HTML.FormField{}, targetField: %Phoenix.HTML.FormField{}} = assigns) do
    ~H"""
    <%= PhoenixFormAwesomplete.copy_value_to_field_script(@sourceField, @dataField, @targetField, @rest) %>
    """
  end

end
