#---------------------------------------------
#toshifon
#2015/6/4
#sorry to b late
#問題のポイント
#・一つのアサートイコールごとにコメントアウトしてやってくと良い。
#・
#---------------------------------------------

class Drink

	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end

	def self.cola
		new(:cola, 120)
	end

	def self.redbull
		new(:redbull, 200)
	end

	def self.water
		new(:water, 100)
	end

end

class VendingMachine

	USABLE_MONEY = [10, 50, 100, 500]

	attr_reader :stock_info 	# 現在投入されているお金の合計
	attr_reader :total 			# これまでの売上の合計
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

	def purchasable?(drink_name)															## その名の通り飲み物が購入可能かを返す
		return false if !@stock_info[drink_name] || @stock_info[drink_name][:stock] == 0	## !@stock_info[drink_name]てのが良く分かんないけど、その飲み物が0個ってのは分かる。そのいずれかならfalseを返す
		@total >= @stock_info[drink_name][:price]											## ？？
	end

	def purchase(drink_name)												## 飲み物を購入するメソッド
		return 'nil (Not purchasable)' unless purchasable?(drink_name)		## 飲み物がpurchasableじゃなかったらnilを返す
		price = @stock_info[drink_name][:price]								## priceとかいうローカル変数にその飲み物の値段を入れとく
	@sale_amount += price 													## 売上合計に買われてった飲み物の値段を足す
	return_money = @total - price 											## 投入されてた金額からその飲み物の値段を引いて、お釣りを計算
	@total = 0 																## これによって@totalは0円に
	@stock_info[drink_name][:stock] -= 1 									## 買われてった飲み物のストックが-1される
	["<Drink: name=#{drink_name}, price=#{price}>", return_money] 			## ？？
	end


end