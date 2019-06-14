defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      context: %{pubsub: CommunityWeb.Endpoint},
      interface: :simple,
      schema: CommunityWeb.Schema
  end
end
