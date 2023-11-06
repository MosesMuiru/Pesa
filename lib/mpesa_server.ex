defmodule Mpesa.MpesaServer do

  use GenServer
  alias Mpesa.Transactions

  # the client
  def start do
    GenServer.start_link( Mpesa.MpesaServer, 0)
  end

  def deposit(pid, amount) do
    GenServer.call(pid,{:deposit, amount})
  end

  def withdraw(pid, amount) do
    GenServer.call(pid, {:withdraw, amount})
  end

  def check_balance(pid) do
    GenServer.call(pid, :check_balance)
  end

  # the server
  def init(amount) do
    {:ok, amount}
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
