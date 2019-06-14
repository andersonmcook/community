defmodule CommunityWeb.NewsResolver do
  alias Community.News

  def all_links(_root, _args, _info) do
    {:ok, News.list_links()}
  end

  def create_link(_root, args, _info) do
    args
    |> News.create_link()
    |> case do
      {:error, _} -> {:error, "could not create link"}
      ok -> ok
    end
  end
end
