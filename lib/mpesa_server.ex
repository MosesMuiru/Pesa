defmodule Mpesa.MpesaServer do
  use GenServer
  alias Mpesa.Transactions

  # the start of the operation
  def main(_) do
    {:ok, pid} = GenServer.start_link(__MODULE__, 0)

    inspect(pid)

    options =
      IO.gets("You have created an account.\n1. Deposit.\n2. WithDraw \n3. Check Balance\n")
      |> String.trim()

    # IO.puts options
    inspect(options)

    case options do
      "1" ->
        amount =
          IO.gets("Enter the amount")
          |> String.trim()
          |> String.to_integer()

        IO.puts(amount)
        deposit(pid, amount)

      "2" ->
        amount =
          IO.gets("Enter the amount you want to withdraw")
          |> String.trim()
          |> String.to_integer()

        IO.puts(amount)
        withdraw(pid, amount)

      "3" ->
        check_balance(pid)

      _ ->
        IO.puts("Option not recognized")
    end
  end

  # def start_link do
  #   GenServer.start_link(__MODULE__, 0)
  # end

  def deposit(pid, amount) do
    GenServer.call(pid, {:deposit, amount})
  end

  def withdraw(pid, amount) do
    GenServer.call(pid, {:withdraw, amount})
  end

  def check_balance(pid) do
    GenServer.call(pid, :check_balance)
  end

  # the server
  def init(_) do
    {:ok, 0}
  end

  def handle_call({:deposit, amount}, _from, initial_amount) do
    # balance = Transactions.deposit(initial_amount, amount)
    balance_amount = Transactions.deposit(initial_amount, amount)
    {:reply, balance_amount, amount}
  end

  def handle_call({:withdraw, amount}, _from, initial_amount) do
    balance = Transactions.withdraw(initial_amount, amount)
    {:reply, balance, initial_amount}
  end

  def handle_call(:check_balance, _from, amount) do
    {:reply, amount, amount}
  end
end
