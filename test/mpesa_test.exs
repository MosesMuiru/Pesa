defmodule MpesaTest do
  alias Mpesa.Transactions
  use ExUnit.Case
  # doctest Mpesa

  # use Mpesa.Transactions

  describe "testing the transactions module" do
    test "deposit in the account" do
      balance = 0
      amount = 3000
      assert Transactions.deposit(balance, amount) == 3000

    end

    test "withdrawing the amount" do
      balance = 3000
      amount = 2000
      assert Transactions.withdraw(balance, amount) == 1000

    end

  end

  describe "testing the mpesa server" do

   test "test deposit of the amout" do
    sendingProcess.run(self())
    

   end

  end
end
