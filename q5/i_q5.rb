#!/usr/bin/env ruby
# encoding: utf-8


class VendingMachine

	attr_reader :stock_info
	# stock_info = { {name: {price: ¥¥, stock: ¥¥}},///}
	def initialize
		@stock_info = {}
		5.times{store(Drink.cola)}

		@total = 0
		@sales_amount = 0
	end

	def store(drink)
		if @stock_info[drink.name] then 
      		@stock_info[drink.name][:stock] += 1
    	else
      		@stock_info[drink.name] = {price: drink.price, stock: 1}
      	end
    end

    attr_reader :total
	def insert(money)
		if money == 1 then return '1 (Not available)'
		elsif money == 5 then return '5 (Not available)'
		elsif money == 10 then @total += 10; return 'nil (OK)'
		elsif money == 50 then @total += 50; return 'nil (OK)'
		elsif money == 100 then @total += 100; return 'nil (OK)'
		elsif money == 500 then @total += 500; return 'nil (OK)'
		end
	end

	def refund
		refund = @total
		@total = 0
		return refund
	end

	def purchasable_drink_names
		result = []
		@stock_info.each do |drink_name,info|
			if info[:price] <= @total then result.push(drink_name) end
		end
		return result
	end


	def purchasable?(drink_name)
		if @total >= @stock_info[drink_name][:price] then true
		else false end
	end 

	attr_reader :sale_amount
	def purchase(drink_name)
		if purchasable?(drink_name) then
			@surplus = @total - @stock_info[drink_name][:price]
			@total = 0
			@stock_info[drink_name][:stock] -= 1
			@sale_amount = @stock_info[drink_name][:price]
			#@sale_amount += @stock_info[drink_name][:price]
			return [ "<Drink: name=#{drink_name}, price=#{@stock_info[drink_name][:price]}>" , @surplus ]
		else return 'nil (Not purchasable)' end
	end
end


class Drink
	attr_reader :name, :price
	def initialize(name,price)
		@name = name
		@price = price
	end

	# ドリンク名と価格
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



