defmodule Mpesa.Transactions do
  @moduledoc """
  two types of transaction to be handled
  check_balance
  withdraw and deposit
  """
alias Balance




 def deposit(balance,amount)  do
    # balance_amount = check_balance(%Balance{})
    balance + amount

  end

  def withdraw(balance_amount,amount) do


    if amount > balance_amount do
      IO.puts "sorry you cannot withdraw #{amount} you balance is :: #{balance_amount}"
    else
     balance =  balance_amount - amount
     IO.puts "you have successfully withdrawned #{amount} you balance is #{balance}"
     balance

    end
  end



end
