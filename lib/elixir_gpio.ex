defmodule ElixirGPIO do

  def main(_args \\ []) do
    hello()
  end

  def hello(on \\ 1000, off \\ 1000) do
    {:ok, gpio} = Circuits.GPIO.open(18, :output)
    loop(gpio, on, off)
    :world
  end

  def loop(pin, on, off) do
    Circuits.GPIO.write(pin, 0)
    :timer.sleep(on)
    Circuits.GPIO.write(pin, 1)
    :timer.sleep(off)
    loop(pin, on, off)
  end
end
