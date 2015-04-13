require 'minitest/autorun'
require_relative 'YOUR_FILE_NAME'  # ex. require_relative 'answer_mura-s'

# このテストを実行して、全てのテストケースに成功するようなコードを作成してください。
# VendingMachineクラス、Drinkクラス、それらの各メソッドを作成する必要があります。
#
# テストの実行方法：
#   ruby test_vending_machine.rb
class TestVendingMachine < MiniTest::Test
  def setup
    @machine = VendingMachine.new
  end

  # テストシナリオ
  def test_vending_machine
    # assert_equal(expect, actual)

    assert_equal({cola: {price: 120, stock: 5}}, @machine.stock_info)
    @machine.store(Drink.redbull)
    @machine.store(Drink.water)
    assert_equal({cola: {price: 120, stock: 5}, redbull: {price: 200, stock: 1}, water: {price: 100, stock: 1}}, @machine.stock_info)
    assert_equal('1 (Not available)', @machine.insert(1))
    assert_equal('5 (Not available)', @machine.insert(5))
    assert_equal('nil (OK)', @machine.insert(10))
    assert_equal('nil (OK)', @machine.insert(50))
    assert_equal(60, @machine.total)
    assert_equal(60, @machine.refund)
    assert_equal(0, @machine.total)
    @machine.insert(100)
    assert_equal([:water], @machine.purchasable_drink_names)
    assert_equal(true, @machine.purchasable?(:water))
    assert_equal(false, @machine.purchasable?(:cola))
    assert_equal(false, @machine.purchasable?(:redbull))
    assert_equal('nil (Not purchasable)', @machine.purchase(:redbull))
    @machine.insert(50)
    assert_equal([:cola, :water], @machine.purchasable_drink_names)
    assert_equal(true, @machine.purchasable?(:cola))
    @machine.insert(100)
    assert_equal([:cola, :redbull, :water], @machine.purchasable_drink_names)
    assert_equal(true, @machine.purchasable?(:redbull))
    assert_equal(250, @machine.total)
    assert_equal(['<Drink: name=redbull, price=200>', 50], @machine.purchase(:redbull))
    assert_equal(0, @machine.total)
    assert_equal(0, @machine.refund)
    assert_equal(200, @machine.sale_amount)
    assert_equal({cola: {price: 120, stock: 5}, redbull: {price: 200, stock: 0}, water: {price: 100, stock: 1}}, @machine.stock_info)
  end
end
