defmodule MultipleEnvs.MixProject do
  use Mix.Project

  def project do
    [
      app: :multiple_envs,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: [
        integration: fn _args ->
          Application.put_env(:multiple_envs, :do_integration_tests, true)
          Mix.Task.run("test")
        end
      ],
      preferred_cli_env: [
        integration: :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
