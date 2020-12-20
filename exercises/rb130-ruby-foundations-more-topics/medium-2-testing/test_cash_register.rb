require 'minitest/autorun'
require 'minitest/pride'

require_relative 'classes/cash_register'
require_relative 'classes/transaction'

class TestCashRegister < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    previous_total = @register.total_money
    @transaction.amount_paid = 50
    @register.accept_money(@transaction)
    assert_equal(previous_total + 50, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 60
    amount_change = 60 - 50
    assert_equal(amount_change, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") do
      @register.give_receipt(@transaction)
    end
  end

  def teardown
  end
end