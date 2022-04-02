defmodule PreloadBugs.Commit do
  use Ecto.Schema

  @primary_key false
  schema "commits" do
    field :repo, :string
    field :pr_number, :integer
    field :hash, :string
  end
end
