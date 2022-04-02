defmodule PreloadBugs.Repo.Migrations.CreatePullRequest do
  use Ecto.Migration

  def change do
    create table(:pull_requests, primary_key: false) do
      add :repo, :string
      add :number, :integer
      add :title, :string
    end
  end
end
