defmodule MultipleEnvsTest do
  use ExUnit.Case

  require Logger

  test "environment" do
    Logger.warning "Do integration tests? " <>
      inspect Application.get_env(:multiple_envs, :do_integration_tests)

    assert true
  end
end
