=begin

0ぐー1ぱー2ちょき	
0勝ち1負け2あいこ

=end 

ROCK = "ぐー"
PAPER = "ぱー"
SCISSOR = "ちょき"

WIN  = "あなたの勝ちです！チッキショ〜！！"
LOSE = "あなたの負けです！ざまあ！！"
DRAW = "あいこかよ！ハラショー"

MATCHTIME = 1

myWin = 0
opWin = 0

def judgeJanken(myHand,opHand)
	if    (myHand == "G")&&(opHand == "G")
		result = 2
	elsif (myHand == "G")&&(opHand == "T")
		result = 1
	elsif (myHand == "G")&&(opHand == "Y")
		result = 0
	elsif (myHand == "T")&&(opHand == "G")
		result = 0
	elsif (myHand == "T")&&(opHand == "T")
		result = 2
	elsif (myHand == "T")&&(opHand == "Y")
		result = 1
	elsif (myHand == "Y")&&(opHand == "G")
		result = 1
	elsif (myHand == "Y")&&(opHand == "T")
		result = 0
	elsif (myHand == "Y")&&(opHand == "Y")
		result = 2
	end
	result
end

def keyToHand(key)
	if (key == "G")
		hand = ROCK
	elsif (key == "T")
		hand = PAPER
	elsif (key == "Y")
		hand = SCISSOR
	end

	hand
end

def numToKey(num)
	if (num == 0)
		key = "G"
	elsif (num == 1)
		key = "T"
	elsif (num == 2)
		key = "Y"
	end

	key
end

def showJanken(result)
	if(result == 0)
		show = WIN
	elsif(result == 1)
		show = LOSE
	elsif(result == 2)
		show = DRAW
	end
	show
end

while (myWin < MATCHTIME)&&(opWin < MATCHTIME)

puts "じゃん！けん！(G:ぐー,T:ぱー,Y:ちょきのいずれかのキーを3秒以内に押してください。)"



myHand = gets.chomp
opHand = numToKey(rand(3))

print "あなた:" , keyToHand(myHand) , "\n"
print "わたし:" , keyToHand(opHand) , "\n"

result = judgeJanken(myHand, opHand)

if (result == 0)
	myWin += 1
elsif (result == 1)
	opWin += 1
end

puts showJanken(result)

print "あなたの勝利数:" , myWin , "\n"
print "わたしの勝利数:" , opWin , "\n"

end

