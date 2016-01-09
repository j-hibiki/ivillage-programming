#shiritori.rb

WIN_MESSAGE =  "あなたの勝ちです"
LOSE_MESSAGE = "あなたの負けです"

WORD_LIST = [
  "あいず", "いもり", "うなぎ", "えかき", "おとこ",
  "かがみ", "きつね", "くだり", "けもの", "こども",
  "さこく", "しるこ", "すあげ", "せかい", "そぼろ",
  "たぬき", "ちくわ", "つるぎ", "てがき", "とけい",
  "なまえ", "にごり", "ぬりえ", "ねごと", "のろけ",
  "はなび", "ひかり", "ふぶき", "へどろ", "ほのお",
  "まもる", "みぞれ", "むかで", "めがね", "もくば",
  "やくば", "ゆらぎ", "よあけ", "らいか", "りかい",
  "るつぼ", "れんが", "ろこつ", "わらい"
]

shiritori_history = []

# 最初に使う言葉
STARTING_WORD = "しりとりはじめ"

def remove_dakuten(charactor)
  new_charactor = ""
  case charactor
    when "が" then new_charactor = "か"
    when "ぎ" then new_charactor = "き"
    when "ぐ" then new_charactor = "く"
    when "げ" then new_charactor = "け"
    when "ご" then new_charactor = "こ"
    
    when "ざ" then new_charactor = "さ"
    when "じ" then new_charactor = "し"
    when "ず" then new_charactor = "す"
    when "ぜ" then new_charactor = "せ"
    when "ぞ" then new_charactor = "そ"

    when "だ" then new_charactor = "た"
    when "ぢ" then new_charactor = "ち"
    when "づ" then new_charactor = "つ"
    when "で" then new_charactor = "て"
    when "ど" then new_charactor = "と"

    when "ば" then new_charactor = "は"
    when "び" then new_charactor = "ひ"
    when "ぶ" then new_charactor = "ふ"
    when "べ" then new_charactor = "へ"
    when "ぼ" then new_charactor = "ほ"

    when "ぱ" then new_charactor = "は"
    when "ぴ" then new_charactor = "ひ"
    when "ぷ" then new_charactor = "ふ"
    when "ぺ" then new_charactor = "へ"
    when "ぽ" then new_charactor = "ほ" 

    else new_charactor = charactor
  end
  return new_charactor
end

def get_last_charactor(word)
  last_charactor = word[-1]
  last_charactor = remove_dakuten(last_charactor)
end

def get_next_word(last_charactor)
  next_word = ""

  #指定された文字から始まるやつ。
  next_word_kouho = []

  #next_word_kouhoに、WORD_LISTから文字を選び出してプッシュしてく作業
  WORD_LIST.each do |word|
    if word[0] == last_charactor
      next_word_kouho << word
    end
  end

  #ランダムで、next_word_kouhoの中から一つ選ぶ
  next_word = next_word_kouho.sample

  next_word
end

def main
  last_charactor = ""
  next_word = ""
  your_word = ""

  #まず自分の「しりとりはじめ」で始まる」
  print "you:", STARTING_WORD, "\n"
  
  last_charactor = get_last_charactor(STARTING_WORD)
  next_word = get_next_word(last_charactor)

  #二巡目
  until (your_word[-1] == "ん") || (next_word[-1] == "ん")
    print "com:",   next_word, "\n"

    your_word = STDIN.gets.chomp
    WORD_LIST << your_word

    last_charactor = get_last_charactor(your_word)
    next_word = get_next_word(last_charactor)

    print "you:", your_word, "\n"
  end

  if your_word[-1]=="ん"
    p LOSE_MESSAGE
  else
    p WIN_MESSAGE
  end

end

main








