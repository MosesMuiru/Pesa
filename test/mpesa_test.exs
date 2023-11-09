defmodule MpesaTest do
  alias Mpesa.Transactions
  alias Mpesa.MpesaServer
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
  # assert MpesaServer.start_link() = {:ok, pid}
  assert {:ok, _pid} = assert MpesaServer.start_link()


   end

   test "the deposit process" do
    amount = 3000
    {:ok, pid} = MpesaServer.start_link()
    {:reply, account_balance, initial_balance} = MpesaServer.deposit(pid, amount)


    assert account_balance > initial_balance


    assert account_balance - initial_balance == amount
  end


   test "the withdrawal process" do
    amount = 3000
    {:ok, pid} = MpesaServer.start_link()
    {:reply, withdraw_amount, initial_amount} = MpesaServer.withdraw(pid, amount)
    assert withdraw_amount < initial_amount

   end

  end
end
