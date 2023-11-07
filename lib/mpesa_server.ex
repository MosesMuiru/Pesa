defmodule Mpesa.MpesaServer do
  use GenServer
  alias Mpesa.Transactions

  # the client
  def main(_) do


  options =  IO.gets "you have created account
    1. deposit
    2.check_balance"
    |> String.trim()

    IO.puts options
    IO.puts is_binary(options)
    pid = self()
  #   cond   do
  # options == "1" ->
  #         amount = IO.gets "enter the amount"
  #         |> String.trim()
  #         deposit(pid,amount)
  # options ==  "2" -> check_balance(pid)
  #   # _-> IO.puts "failed"
  #   end

    if options == 1 do
      amount = IO.gets "enter the amount"
          |> String.trim()
          |>String.to_float()
          # deposit(pid, amount)
    else
      IO.puts "fuck no working"
    end

  end

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
    {:ok, {}}
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
