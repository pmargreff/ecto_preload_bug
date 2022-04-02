import Config

config :preload_bugs,
      ecto_repos: [PreloadBugs.Repo]

config :preload_bugs, PreloadBugs.Repo,
  database: "preload_bugs_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
