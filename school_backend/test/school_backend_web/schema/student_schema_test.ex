defmodule Schoolbackend.StudentSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "Student schema test" do
    @insert_params %{
      password: "Password123?",
    }

    test "changeset test." do
      
    end
  end
end