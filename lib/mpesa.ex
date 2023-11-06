# defmodule Mpesa do
#   @moduledoc """
#   this will contain the server
#   init -> cast -> terminate

#   ## server


#   """
#   alias Mpesa.Transactions
#   alias Balance

#   use GenServer

#   # client
#   def start_link do
#     GenServer.start_link(Mpesa, Transactions.check_balance(%Balance{}))
#   end

#   # handle call
#   @spec deposit(atom() | pid() | {atom(), any()} | {:via, atom(), any()}, any()) :: any()
#   def deposit(pid, amount) do
#     GenServer.call(pid, {:deposit, amount})
#   end

#   def withdraw(pid, amount) do
#     GenServer.call(pid, {:withdraw, amount})
#   end

#   def check_balance(pid) do
#     GenServer.call(pid, {:check_balance})
#   end
#   # server

#   def init(amount) do
#     {:ok, amount}

#   end

#   def handle_call({:deposit, amount}, _from, initial_amount) do

#     balance = Transactions.deposit(amount + initial_amount)
#     # %{account_balance} = balance
#     {:reply, balance, balance}

#   end

#   def handle_call({:withdraw, amount}, _from, initial_amount) do
#     balance = Transactions.withdraw(initial_amount - amount)
#     {:reply,balance, initial_amount}

#   end

#   def handle_call({:check_balance}, _from, amount) do
#    balance = Transactions.check_balance %Balance{}
#     {:reply, balance, amount }
#   end



# end
