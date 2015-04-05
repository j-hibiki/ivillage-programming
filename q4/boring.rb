input1 = [
[1,5],[2,7],[0,0],[2,4],[1,0],
[0,0],[1,2],[8,1],[1,2],[0,0,-1]
]

input2 = [
[1,5],[10,-1],[7,3],[10,-1],[8,0],
[9,1],[0,10],[10,-1],[7,2],[9,0,-1]
]

input3 = [
[10,-1],[10,-1],[10,-1],[10,-1],[10,-1],
[10,-1],[10,-1],[10,-1],[10,-1],[10,10,10]
]

score = 0

def calc_score(input)
  score_sum = 0
  score = [0,0,0,0,0,0,0,0,0,0]
  
  #===========================第1~第9レーン=======================
  for lane_number in 0..8 do
  
    #=========================1投目===========================
    if input[lane_number][0] == 10  #ストライク判定

      score[lane_number] += input[lane_number][0]
      score[lane_number] += input[lane_number+1][0]
      
      if input[lane_number+1][0] == 10 #次のレーンもストライクだった場合
      
        if lane_number == 8 #第9レーンの場合
          score[lane_number] += input[lane_number+1][1]
        else
          score[lane_number] += input[lane_number+2][0]
        end
      
      else
        score[lane_number] += input[lane_number+1][1]
      end
      
      #2投目は投げないので次のレーンへ移動
      score_sum += score[lane_number]
      next
    
    else
      score[lane_number] += input[lane_number][0]
    end

    #=========================2投目===========================
    if input[lane_number][1] + input[lane_number][0] == 10 #スペア判定
      score[lane_number] += input[lane_number+1][0]
      score[lane_number] += input[lane_number][1]
    else
      score[lane_number] += input[lane_number][1]
    end

    score_sum += score[lane_number]
  end

  #最終レーン
  lane_number = 9

    score[lane_number] += input[lane_number][0]
    score[lane_number] += input[lane_number][1]

  if (input[lane_number][0] == 10)||(input[lane_number][0] + input[lane_number][1] == 10)
    score[lane_number] += input[lane_number][2]
  end
    score_sum += score[lane_number]

  score_sum
end

def assert_equal(a,b)
  if a == b
    print "正解です\n"
  else
    print "残念\n"
  end
end


assert_equal(37,calc_score(input1))
assert_equal(139,calc_score(input2))
assert_equal(300,calc_score(input3))





