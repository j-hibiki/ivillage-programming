#!/usr/bin/env ruby
# encoding: utf-8

def calc_score(input)
	spare,strike = [0,0], [0,0]
	score = [0,spare,strike]
	input.each do |turn|
		et = EachTurn.new(0, 0, 0, score[1], score[2]) 
		et.charge(turn)
		score = et.calc(score)
	end
	return score[0]
end


class EachTurn
	def initialize(first,second,third,spare,strike)
		@first,@second,@third = first,second,third
		@spare,@strike = spare,strike
	end

	def charge(turn)
		@first = turn[0]
		@second = turn[1]
		if turn.length > 2 then @third = turn[2] end
		if @first == 10 then @strike[0] = 1
		elsif @first + @second == 10 then @spare[0] = 1 end
	end 

	def calc(score)
		# add this turn score
		if isnot_garter(@first) then score[0] += @first 
		else @first = 0 end
		if isnot_garter(@second) then score[0] += @second 
		else @second = 0 end
		if isnot_garter(@third) then score[0] += @third
		else @third = 0 end

		# 前回スペア
		if @spare[1] == 1 then 
			score[0] += @first
			@spare[1] = 0
		end
		# 前回ストライク　＆　今回もストライク　（２連続ストライク）
		if @strike[1] == 1 and @first == 10 then 
			score[0] += @first + 10
			@strike[1] = 1
		# 前回ストライク　＆　今回はストライクでない　（単発ストライク）	
		elsif @strike[1] == 1 then
			score[0] += @first + @second
			@strike[1] = 0
		end

		if @spare[0] == 1 then @spare = [0,1] end
		if @strike[0] == 1 then @strike = [0,1] end
		score[1] = @spare
		score[2] = @strike

		return score 
	end

	def isnot_garter(it)
		if it != -1 then flag = true 
		else flag = false end
		return flag
	end
end