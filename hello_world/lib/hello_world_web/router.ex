defmodule HelloWorldWeb.Router do
  use HelloWorldWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWorldWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  defp max_age(conn, max_age) when is_integer(max_age) do
    Plug.Conn.put_resp_header(conn, "cache-control", "max-age=" <> to_string(max_age))
  end

  pipeline :api_cached do
    plug :accepts, ["json"]
    plug :max_age, 60 * 60 * 12
  end

  scope "/", HelloWorldWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/posts", PostController
  end

  scope "/rest/public", HelloWorldWeb do
    pipe_through :api_cached

    # get "/v1/productcat", JsonProductCategoryController, :index

    resources "/v1/productcat", JsonProductCategoryController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWorldWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hello_world, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HelloWorldWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
