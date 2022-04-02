defmodule PreloadBugs.PullRequest do
  use Ecto.Schema

  @primary_key false
  schema "pull_requests" do
    field :repo, :string
    field :number, :integer
    field :title, :string

    has_many :commits, PreloadBugs.Commit, references: :number
  end
end
