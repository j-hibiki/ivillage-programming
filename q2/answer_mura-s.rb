module Message
  START = '-> じゃん! けん! (G:ぐー,T:ぱー,Y:ちょきのいずれかのキーを3秒以内に押してください。)'
  COUNTDOWN = '-> カウントダウン'
  WIN = '-> あなたの勝ちです！チッキショ〜！！'
  LOSE = '-> あなたの負けです！ざまあ！！'
  DRAW = '-> あいこかよ！ハラショー'
  TIMEOVER = '-> 〜〜タイムオーバー〜〜お前に食わせるタンメンは、、、ねえ！'
  WRONG_HAND = 'G, T, Yのどれかを出してください'
end

class Janken
  HANDS = %w(G T Y)

  def play
    puts Message::START

    th = Thread.new do
      (1..3).to_a.reverse.each do |i|
        puts "#{Message::COUNTDOWN} #{i}"
        sleep 1
      end

      puts "#{Message::TIMEOVER}"
      exit
    end

    hand = gets.chomp
    Thread.kill(th)
    judge(hand, get_com_hand)
  end

  private

  def judge(hand, com_hand)
    unless HANDS.include?(hand)
      puts Message::WRONG_HAND
      return
    end

    if hand == com_hand
      puts Message::DRAW
    elsif (hand == 'G' && com_hand == 'Y') || (hand == 'T' && com_hand == 'G') || (hand == 'Y' && com_hand == 'T')
      puts Message::WIN
    elsif (hand == 'G' && com_hand == 'T') || (hand == 'T' && com_hand == 'Y') || (hand == 'Y' && com_hand == 'G')
      puts Message::LOSE
    end
  end

  def get_com_hand
    com_hand = HANDS.sample
    puts com_hand
    com_hand
  end
end

Janken.new.play
