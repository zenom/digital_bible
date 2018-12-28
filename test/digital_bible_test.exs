defmodule DigitalBibleTest do
  use ExUnit.Case
  doctest DigitalBible

  test "greets the world" do
    assert DigitalBible.hello() == :world
  end
end
