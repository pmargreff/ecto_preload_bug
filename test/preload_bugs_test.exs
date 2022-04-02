defmodule PreloadBugsTest do
  use ExUnit.Case
  import Ecto.Query
  alias PreloadBugs.{Repo, Commit, PullRequest}

  doctest PreloadBugs

  setup do
    Repo.delete_all(Commit)
    Repo.delete_all(PullRequest)
    :ok
  end

  test "left join with multiple on clause preloading" do
    pr_1 = Repo.insert!(%PullRequest{number: 1, repo: "elixir-lang/elixir", title: "1"})
    pr_2 = Repo.insert!(%PullRequest{number: 2, repo: "elixir-lang/elixir", title: "2"})
    pr_2 = Repo.insert!(%PullRequest{number: 3, repo: "elixir-lang/elixir", title: "2"})

    Repo.insert!(%Commit{pr_number: 1, repo: "elixir-lang/elixir", hash: "abc"})
    Repo.insert!(%Commit{pr_number: 2, repo: "elixir-lang/elixir", hash: "ef0"})
    Repo.insert!(%Commit{pr_number: 3, repo: "elixir-lang/elixir", hash: "ef0"})

    query = (from pr in PullRequest,
      left_join: c in ^(from Commit),
      on: c.pr_number == pr.number and c.repo == pr.repo,
      preload: [commits: c])

    assert 3 = Repo.aggregate(query, :count)
    assert [result_1, result_2, result_3] = Repo.all(query)
  end
end
