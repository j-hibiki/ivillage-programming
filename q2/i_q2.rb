#!/usr/bin/env ruby
# encoding: utf-8


def computer_hand()
	# 乱数確率の場合
	int_hand = (rand(10) + 1)%3
	if int_hand == 0 then hand = "G"
	elsif int_hand == 1 then hand = "Y"
	elsif int_hand == 2 then hand = "T"
	end
	puts "cpu: #{hand}"
	return hand
end


def judgement(player,cpu)
	flag = ""
	# 勝ちパターン
	if ( player == "G" and cpu == "Y" ) or ( player == "Y" and cpu == "T" ) or ( player == "T" and cpu == "G" ) then
		puts "-> あなたの勝ちです！チッキショ〜！！"
		flag = "Win"
	# あいこパターン
	elsif ( player == "Y" and cpu == "Y" ) or ( player == "T" and cpu == "T" ) or ( player == "G" and cpu == "G" ) then
		puts "-> あいこかよ！ハラショー"
		flag = "Draw"
	# 負けパターン
	elsif ( player == "Y" and cpu == "G" ) or ( player == "T" and cpu == "Y" ) or ( player == "G" and cpu == "T" ) then
		puts "-> あなたの負けです！ざまあ！！"
		flag = "Lose"
	end
	return flag
end


# 時間切れパターン
def timer(sec,tmain,score)
	ttimer = Thread.start{
	  while sec > 0 do
	  	puts "-> カウントダウン　#{sec}"
	    sleep(1) 
	    sec -= 1
	  end
	  puts "-> 〜〜タイムオーバー〜〜お前に食わせるタンメンは、、、ねえ！"
	  #exit(0) 1回勝負用
	  tmain.kill
	  score["Over"] += 1
  	}
  	return ttimer
end

# 複数回戦用
def buttle_times(times)
	score = {"Win" => 0, "Draw" => 0, "Lose" => 0, "Over" => 0}
	i = 1
	while i <= times.to_i do
		puts "-------   #{i}回戦を始めます。準備はいいですか？まだ押さないでね  -----"
		flag = ""
		sleep(2) # ちょっと息継ぎタイム
		tmain = Thread.start{ flag = main(tmain,score) }
		tmain.join
		i += 1
		if flag != "" then score = add_score(score,flag) end
		#puts score
	end
	puts "【戦績】　#{times} 戦　#{score["Win"]} 勝　#{score["Lose"]} 敗　#{score["Draw"]} 引き分け　#{score["Over"]} 時間切れ"
	if score["Over"] > 0 then puts "焦らずもうすこし決断を早くしましょう。。もったいない！" end
end

def add_score(score,flag)
	#puts "pass #{flag}"
	if flag == "Win" then score["Win"] += 1
	elsif flag == "Draw" then score["Draw"] += 1
	elsif flag == "Lose" then score["Lose"] += 1
	end
	return score
end



def main(tmain,score)
	puts "-> じゃん! けん! (G:ぐー,T:ぱー,Y:ちょきのいずれかのキーを3秒以内に押してください。)"
	ttimer = timer(3,tmain,score)     # 3秒カウントダウン
	cnt_wrong = 0 
	# 自分の手　選択
	while player = STDIN.gets
		if player.chomp == "G" or player.chomp == "Y" or player.chomp == "T" then
			player = player.chomp
			break
		elsif cnt_wrong < 3
			cnt_wrong += 1
			puts "-> #{cnt_wrong}回目の想定外の一手です。(G:ぐー,T:ぱー,Y:ちょきのいずれかのキーを3秒以内に押してください。)"
		else
			puts "おまえじゃんけん知らないだろ！おとといきやがれ！"
			#exit(0)　1回勝負用
			break
		end
	end

	# コンピューターの手選択
	cpu = computer_hand()

	# 勝ち負け判定
	if player != "" and cpu != "" then
		flag = judgement(player,cpu)
	end
	ttimer.kill
	return flag
end


# Program Start
puts "<< 市田発　じゃんけんゲーム！ >>"
# @author = icchida
# @date   = 2015.03.16
# @Language = ruby and english
# ex: # ruby i_q2.rb <buttle_times>
if ARGV[0] != "" and ARGV.size == 1 then
	buttle_times(ARGV[0])
else
	puts "半角数字で対戦回数を入力してください。"
	puts "引数は一つのみです。 ex $ ruby i_q2.rb 3"
	exit(0)
end


