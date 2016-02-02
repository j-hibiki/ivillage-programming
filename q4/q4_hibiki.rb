def calc_score(input)
  frame_score = []
  score_sum = 0

  #第1フレームから第8フレームまで
  for frame in 0..7 do
    #ストライク
    if input[frame][0] == 10
      #次もストライク
      if input[frame+1][0] == 10
        frame_score[frame] = 10 + input[frame+1][0] + input[frame+2][0]
      #次がストライク以外
      else
        frame_score[frame] = 10 + input[frame+1][0] + input[frame+1][1]
      end
    #スペア
    elsif input[frame][0] + input[frame][1] == 10
      frame_score[frame] = 10 + input[frame+1][0]
    #ストライクでもスペアでもない
    else
      frame_score[frame] = input[frame][0] + input[frame][1]
    end
  end

  #第9フレーム
  frame = 8
  #ストライク
  if input[frame][0] == 10
    frame_score[frame] = 10 + input[frame+1][0] + input[frame+1][1]
  #スペア
  elsif input[frame][0] + input[frame][1] == 10
    frame_score[frame] = 10 + input[frame+1][0]
  #ストライクでもスペアでもない
  else
    frame_score[frame] = input[frame][0] + input[frame][1]
  end

  #第10フレーム
  frame = 9
  #ストライクかスペア
  if (input[frame][0] == 10)||(input[frame][0]+input[frame][1] == 10)
    frame_score[frame] =  input[frame][0]
    frame_score[frame] += input[frame][1]
    frame_score[frame] += input[frame][2]
  #ストライクでもスペアでもない
  else
    frame_score[frame] =  input[frame][0]
    frame_score[frame] += input[frame][1]
  end

  #各フレームのスコアの総和をとる
  score_sum = frame_score.inject(:+)

  return score_sum

end