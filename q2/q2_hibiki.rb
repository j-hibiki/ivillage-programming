# 160112 変数名と関数名をsnake_caseに変更

ROCK 		= "ぐー"
PAPER 	= "ぱー"
SCISSOR = "ちょき"

WIN_MESSAGE  		= "あなたの勝ちです！チッキショ〜！！"
LOSE_MESSAGE 		= "あなたの負けです！ざまあ！！"
DRAW_MESSAGE 		= "あいこかよ！ハラショー"
TIMEOUT_MESSAGE = "〜〜タイムオーバー〜〜お前に食わせるタンメンは、、、ねえ！"

def judge_janken(my_hand,op_hand)
	# 0勝ち1負け2あいこ
	if    (my_hand == "G")&&(op_hand == "G")
		result = 2
	elsif (my_hand == "G")&&(op_hand == "T")
		result = 1
	elsif (my_hand == "G")&&(op_hand == "Y")
		result = 0
	elsif (my_hand == "T")&&(op_hand == "G")
		result = 0
	elsif (my_hand == "T")&&(op_hand == "T")
		result = 2
	elsif (my_hand == "T")&&(op_hand == "Y")
		result = 1
	elsif (my_hand == "Y")&&(op_hand == "G")
		result = 1
	elsif (my_hand == "Y")&&(op_hand == "T")
		result = 0
	elsif (my_hand == "Y")&&(op_hand == "Y")
		result = 2
	end
	result
end

def key_to_hand(key)
	if (key == "G")
		hand = ROCK
	elsif (key == "T")
		hand = PAPER
	elsif (key == "Y")
		hand = SCISSOR
	end

	hand
end

def num_to_key(num)
	# 0ぐー1ぱー2ちょき	
	if (num == 0)
		key = "G"
	elsif (num == 1)
		key = "T"
	elsif (num == 2)
		key = "Y"
	end

	key
end

def show_janken(result)
	if(result == 0)
		show = WIN_MESSAGE
	elsif(result == 1)
		show = LOSE_MESSAGE
	elsif(result == 2)
		show = DRAW_MESSAGE
	end
	show
end

def main

puts "じゃん！けん！(G:ぐー,T:ぱー,Y:ちょきのいずれかのキーを3秒以内に押してください。)"

	countdown_thread = Thread.new do
		for num in 1..3 do
			puts 4-num
			sleep(1)
		end
		puts TIMEOUT_MESSAGE
		exit
	end

	input_thread = Thread.new do
		$my_hand = gets.chomp
		while $my_hand == nil; end
		countdown_thread.kill
		$op_hand = num_to_key(rand(3))
		print "あなた:" , key_to_hand($my_hand) , "\n"
		print "わたし:" , key_to_hand($op_hand) , "\n"
	end

	countdown_thread.join
	input_thread.join

	result = judge_janken($my_hand, $op_hand)
	puts show_janken(result)

end

main