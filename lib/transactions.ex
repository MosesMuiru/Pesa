defmodule Mpesa.Transactions do
  @moduledoc """
  two types of transaction to be handled
  check_balance
  withdraw and deposit
  """

alias Balance


def check_balance(account) do

  %Balance{account_balance: account_balance} = account
  account_balance

end


@spec deposit(float())::nil
 def deposit(amount)  do
    balance_amount = check_balance(%Balance{})
    new_amount = balance_amount + amount

    # IO.puts "you have successfully deposited"
    # %Balance{account_balance: new_amount}
    new_amount
  end

  def withdraw(amount) do
    balance_amount = check_balance(%Balance)

    if amount > balance_amount do
      IO.puts "sorry you cannot withdraw #{amount} you balance is :: #{balance_amount}"
    else
      b = balance_amount - amount
      %Balance{account_balance: b}
      IO.puts "you have successfully withdrawned #{amount} you balance is #{balance_amount}"
    end
  end

  # def withdraw(amount) do

  #   case balance_amount() do
  #     amount >
  #   end
  # end


end
