#q7-hibiki.rb
#160202
#j-hibiki

MESSAGE = [
  "ヒットアンドブローを始めます",
  "4桁の数字を入力して下さい",
  "正解です。あなたの勝ちです",
  "数字が4桁ではありません。4桁の数字を入力して下さい",
  "ヒットアンドブローを終了します",
  "10ターン経過しました。あなたの負けです"
]

#正解の数字4桁を発生させる
def get_ans_number
  nums = ["0","1","2","3","4","5","6","7","8","9"]
  #numsの要素をランダムに並べかえる
  answer_nums = nums.sample(4).join
  answer_nums
end

#数字4桁を入力させる
def get_input_number 
  input_number = STDIN.gets.chomp
  if (input_number == "q")
    puts MESSAGE[4]
    exit
  end
  until input_number.length == 4
    if (input_number == "q")
      puts MESSAGE[4]
      exit
    end
    p MESSAGE[3]
    input_number = STDIN.gets.chomp
  end
  input_number
end

#ヒット数とブロー数の判定
def check_ans(ans, num)
  hit_times = 0
  blow_times = 0
  4.times do |digit|
    if num[digit] == ans[digit]
      hit_times += 1
    elsif ans.include?(num[digit])
      blow_times += 1
    end
  end
  puts "#{hit_times}H#{blow_times}B"
end

def main
  puts MESSAGE[0]
  ans_number = get_ans_number
  answer_times = 1
  10.times do |num_of_turns|
    puts "#{num_of_turns+1}回目の回答です"
    puts MESSAGE[1]
    input_number = get_input_number
    check_ans(ans_number,input_number)
  
    if input_number == ans_number
      puts MESSAGE[2]
      puts "回答数は#{num_of_turns}回でした"
      exit
    end
    answer_times += 1
  end
  puts MESSAGE[5]
  puts "正解は#{ans_number}でした"
end

main