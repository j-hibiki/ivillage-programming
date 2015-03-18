#!/usr/bin/env ruby
# encoding: utf-8

# "<< 西村発　(ひらがな) しりとりゲーム！ >>"
# @author = icchida
# @date   = 2015.03.17
# @Language = ruby and english
# ex: # ruby i_q3.rb
# @rules following below
# 1. 「ん」で終わる単語を入力/選択　もしくは　Playerは５秒以内に入力できなければ負け。CPUの場合は単語がでてこなくなったら負け。
# 2. 使用する言語は　日本語のひらがなのみ
# 3. 何も入力しないでのパスは禁止
# 4. 両者使用した単語は２度使用できない
# 5. 終了後、その回に利用された単語が単語リストに加わり次回から利用できる


# CPUが使用するワードリスト
def word_list(fwordlist)
	word_list = []
	IO.foreach("word_list.txt") do |word|
  		if word != "" then word_list.push(word.chomp) end
	end
	return word_list
end


# CPUのターンに利用するサブルーチン　相互呼び出しによる持続性
def cpu_word(tmain,used,player,wl)
	cpu = ""
	wl.each do |ew|
  		if ew[0,1] == player[-1,1] then cpu = ew end
	end
	puts "cpu: #{cpu}"
	# 負け判定　「２回利用」と空白パスと「ん」
	lost_condition(cpu,used,"CPU")
	# 許可後
	player_word(tmain,used,cpu,wl)
end


# PlayerのCPUのターンに利用するサブルーチン　相互呼び出しによる持続性
def player_word(tmain,used,cpu,wl)
	print "player: "
	ttimer = timer(5,tmain)
	while player = STDIN.gets
		player = player.chomp
		ttimer.kill
		# 負け判定　「２回利用」と空白パスと「ん」
		lost_condition(player,used,"Player")
		# 許可後
		cpu_word(tmain,used,player,wl)
	end
end


# 終了判定　サブルーチン
def lost_condition(word,used,which)
	# 2回利用時の終了判定
	used.each do |uew|
		if word == uew then
			puts "******  その単語「#{word}」はすでに利用されています。"
			puts "[[[[[[    #{which}の負けです。   ]]]]]] "
			add_wordlist(used,ARGV[0])
			exit(0)
		end
	end

	used.push(word)
	# 空白入力による終了判定
	if word == "" then
		puts "///////  空白によるパス禁止のため、#{which}の負けです。///////"
		add_wordlist(used,ARGV[0])
		exit(0)
	end
	# 「ん」終了判定
	if word[-1,1] == "ん" then
		puts "<<<<<<  「ん」が最後については、#{which}の負けです。>>>>>>"
		add_wordlist(used,ARGV[0])
		exit(0)
	end
end


# 終了後のワードリストの更新  注意：CPUが同じ単語を使えるようにあえて、単語の独立性はとらない
def add_wordlist(used,fwordlist)
	File.open(fwordlist,"a") do |file|
		used.each do |u|
			file.puts u
		end
	end
end


# 時間切れパターン
def timer(sec,tmain)
	ttimer = Thread.start{
	  while sec > 0 do
	  	print "#{sec} -> "
	    sleep(1) 
	    sec -= 1
	  end
	  puts "-> 0 "
	  puts "時間切れのためPlayerの敗北。語彙力を鍛えましょう。"
	  tmain.kill
  	}
  	return ttimer
end

#############################################################################################
# Program Start
#############################################################################################
puts "<< 西村発　(ひらがな) しりとりゲーム！ >>"

if ARGV.size != 1 then
	puts "読み取るワードリストファイルのみを引数に与えてください。ex $ ruby i_q3.rb word_list.txt"
	exit(0)	
end

# ワードリストファイルから配列作成
fwordlist = ARGV[0]
wl = word_list(fwordlist)

# 既に利用されたワード蓄積配列
used = []

# プレイヤーのターンからスタート
puts "(好きな単語を「ひらがな」入力してください。)"
cpu = ""
tmain = Thread.start{ player_word(tmain,used,cpu,wl) }
tmain.join





