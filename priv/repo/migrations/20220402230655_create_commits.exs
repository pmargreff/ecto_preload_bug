defmodule PreloadBugs.Repo.Migrations.CreateCommits do
  use Ecto.Migration

  def change do
    create table(:commits, primary_key: false) do
      add :repo, :string
      add :pr_number, :integer
      add :hash, :string
    end
  end
end
