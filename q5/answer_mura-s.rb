class VendingMachine
  USABLE_MONEY = [10, 50, 100, 500]

  # Drinkのnameとpriceとstockを持ったHash
  #
  # Example:
  #   {cola: {price: 120, stock: 5},
  #    redbull: {price: 200, stock: 1},
  #    water: {price: 100, stock: 1}}
  attr_reader :stock_info

  # 現在投入されているお金の合計
  attr_reader :total

  # これまでの売上の合計
  attr_reader :sale_amount

  def initialize
    @stock_info = {}
    5.times { store(Drink.cola) }

    @total, @sale_amount = 0, 0
  end

  # VendingMachineにDrinkを投入する
  def store(drink)
    if @stock_info[drink.name]
      @stock_info[drink.name][:stock] += 1
    else
      @stock_info[drink.name] = {price: drink.price, stock: 1}
    end
  end

  # VendingMachineにお金を投入する
  #
  # @param [Integer] money お金
  # @return [String] 結果を表す文字列
  def insert(money)
    return "#{money} (Not available)" unless USABLE_MONEY.include?(money)

    @total += money
    'nil (OK)'
  end

  # 投入されているお金を返却する
  def refund
    return_money = @total
    @total = 0
    return_money
  end

  # 購入可能なDrinkのリストを返す
  def purchasable_drink_names
    result = []
    @stock_info.each do |drink_name, info|
      result << drink_name if @total >= info[:price]
    end
    result
  end

  # 対象のDrinkが買えるかどうかを返す
  #
  # @param [Symbol] drink_name Drinkの名前
  # @return [Boolean] true or false
  def purchasable?(drink_name)
    return false if !@stock_info[drink_name] || @stock_info[drink_name][:stock] == 0

    @total >= @stock_info[drink_name][:price]
  end

  # Drinkを購入する
  #
  # @param [Symbol] drink_name Drinkの名前
  # @return [Array<String, Integer>] 購入したDrinkの情報とお釣り
  def purchase(drink_name)
    return 'nil (Not purchasable)' unless purchasable?(drink_name)

    price = @stock_info[drink_name][:price]
    @sale_amount += price
    return_money = @total - price
    @total = 0
    @stock_info[drink_name][:stock] -= 1

    ["<Drink: name=#{drink_name}, price=#{price}>", return_money]
  end

end

class Drink
  # 外部からnewできなくする
  private_class_method :new

  attr_reader :name, :price

  # @param [Symbol] name 名前
  # @param [Integer] price 値段
  def initialize(name, price)
    @name = name
    @price = price
  end

  class << self
    # Drink生成用のメソッド
    def cola
      new(:cola, 120)
    end

    def redbull
      new(:redbull, 200)
    end

    def water
      new(:water, 100)
    end
  end
end
