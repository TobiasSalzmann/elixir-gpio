defmodule ElixirGPIO do
  @moduledoc """
  Documentation for ElixirGPIO.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirGPIO.hello()
      :world

  """
  def hello do
    {:ok, gpio} = Circuits.GPIO.open(18, :output)
    loop(gpio)
    :world
  end

  def loop(pin) do
    Circuits.GPIO.write(pin, 1)
    :timer.sleep(1000)
    Circuits.GPIO.write(pin, 0)
    :timer.sleep(1000)
    loop(pin)
  end
end
