Testing ExUnit running under different mix environments.

## Problem

When trying to run ExUnit from an environment other than `test`, ExUnit exits
with the following error. This happens regardless of whether `MIX_ENV` is set
on the command line, or `preferred_cli_env` is set in `mix.exs`.

```text
** (Mix) "mix test" is running in the "integration" environment. If you are
running tests from within another command, you can either:

  1. set MIX_ENV explicitly:

      MIX_ENV=test mix test.another

  2. set the :preferred_envs for "def cli" in your mix.exs:

      def cli do
        [preferred_envs: ["test.another": :test]]
      end
```

## Solutions

1. Remove [these lines](https://github.com/elixir-lang/elixir/blob/61acf336c190652edb61ca454038bd2a1a524229/lib/mix/lib/mix/tasks/test.ex#L514-L529) from ExUnit.

2. Use the workaround shown in this repo. It may need some syntax sugar or
   modifications to test_helper.exs in practice. `mix integration` sets a flag
   that can be picked up by another set of tests.

3. I typically use [ESpec](https://hex.pm/packages/espec) and haven't encountered this issue.
