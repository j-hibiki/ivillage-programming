# Please code 9 methods that judge the hand of poker.

A_WIN_MSG = "PlayerA win!"
B_WIN_MSG = "PlayerB win!"
DRAW_MSG  = "Draw"

TALON = [
  "sA","s2","s3","s4","s5","s6","s7","s8","s9","sX","sJ","sQ","sK",
  "hA","h2","h3","h4","h5","h6","h7","h8","h9","hX","hJ","hQ","hK",
  "dA","d2","d3","d4","d5","d6","d7","d8","d9","dX","dJ","dQ","dK",
  "cA","c2","c3","c4","c5","c6","c7","c8","c9","cX","cJ","cQ","cK"
]

# hands for testing
TEST_LS_FLUSH = ["sX","sJ","sQ","sK","sA"]
TEST_S_FLUSH  = ["s3","s4","s5","s6","s7"]
TEST_F_CARD   = ["s8","h8","d8","c8","s9"]
TEST_F_HOUSE  = ["d6","h6","c6","h2","c2"]
TEST_FLUSH    = ["dA","d3","d5","d9","dX"]
TEST_STRAIGHT = ["d4","c5","c6","d7","h8"]
TEST_TH_CARD  = ["d5","c5","h5","cX","cJ"]
TEST_TW_PAIRS = ["d2","c2","h4","c4","s9"]
TEST_ONE_PAIR = ["dA","cA","h5","h8","dX"]

def shuffle(cards)
  cards = cards.shuffle
end

def sort(hand)
  hand = hand.sort_by{|file| file[/\d+/].to_i}
end

#1
def is_loyal_straight_flush(tefuda)
end

#2
def is_straight_flush(tefuda)
end

#3
def is_four_card(tefuda)
end

#4
def is_full_house(tefuda)
end

#5
def is_flush(tefuda)
end

#6
def is_straight(tefuda)
end

#7
def is_three_card(tefuda)
end

#8
def is_two_pairs(tefuda)
end

#9
def is_one_pair(tefuda)
end

def judge_hand(tefuda)
  hand = 0
  if is_loyal_straight_flush(tefuda) == true then
    hand = 1
  elsif is_straight_flush(tefuda) == true then
    hand = 2
  elsif is_four_card(tefuda) == true then
    hand = 3
  elsif is_full_house(tefuda) == true then
    hand = 4
  elsif is_flush(tefuda) == true then
    hand = 5
  elsif is_straight(tefuda) == true then
    hand = 6
  elsif is_three_card(tefuda) == true then
    hand = 7
  elsif is_two_pairs(tefuda) == true then
    hand = 8
  elsif is_one_pair(tefuda) == true then
    hand = 9
  else
    hand = 10
  end
  hand 
end



def test_cases
  puts "result of test1:#{is_loyal_straight_flush(TEST_LS_FLUSH)}"
  puts "result of test2:#{is_straight(TEST_S_FLUSH)}"
  puts "result of test3:#{is_four_card(TEST_F_CARD)}"
  puts "result of test4:#{is_full_house(TEST_F_HOUSE)}"
  puts "result of test5:#{is_flush(TEST_FLUSH)}"
  puts "result of test6:#{is_straight(TEST_STRAIGHT)}"
  puts "result of test7:#{is_three_card(TEST_TH_CARD)}"
  puts "result of test8:#{is_two_pairs(TEST_TW_PAIRS)}"
  puts "result of test9:#{is_one_pair(TEST_ONE_PAIR)}"
end

def play
  talon = shuffle(TALON)

  op_hand = []
  my_hand = []

  5.times do |hand|
    my_hand.push(talon.pop)
    op_hand.push(talon.pop)
  end

  my_hand = sort(my_hand)
  op_hand = sort(op_hand)

  playerA_rank = judge_hand(my_hand)
  playerB_rank = judge_hand(op_hand)

  msg = ""

  if playerA_rank < playerB_rank
    msg = A_WIN_MSG
  elsif playerB_rank < playerA_rank
    msg = B_WIN_MSG
  else
    msg = DRAW_MSG
  end

  puts "playerA's tefuda is #{my_hand}"
  puts "playerB's tefuda is #{op_hand}"
  puts "playerA's hand is #{judge_hand(my_hand)}"
  puts "playerB's hand is #{judge_hand(op_hand)}"
  puts msg

end

test_cases
#play