# ボーリングの合計スコアを計算する
#
# @param [Array] input 各フレームごとのスコア、２次元配列
# @return [Number] 合計スコア
def calc_score(input)
  frame_results = Array.new(10, 0)
  strike_spare_counter = Array.new(10, 0)

  input.each_with_index do |frame_in, idx|
    first = frame_in[0]
    second = frame_in[1]

    add_strike_spare_bonus(frame_results, strike_spare_counter, first, second, idx)

    # strike & spareチェック
    strike_spare_counter[idx] = 2 if first == 10
    strike_spare_counter[idx] = 1 if (first != 10) && (first + second == 10)

    # 今回のフレームのスコア加算
    if idx != 9
      frame_results[idx] = (first == 10) ? first : (first + second)
    else
      # 最終フレーム
      third = frame_in[2]
      frame_results[idx] = (third == -1) ? (first + second) : (first + second + third)
    end
  end

  return frame_results.inject(:+)
end

# 前までの回でstrike or spareがあった場合のポイント加算
def add_strike_spare_bonus(frame_results, strike_spare_counter, first, second, idx)
  strike_spare_counter.each_with_index do |c, i|
    if c > 0
      frame_results[i] += first
      strike_spare_counter[i] -= 1
    end

    if c == 2 && (first != 10 || idx == 9)
      frame_results[i] += second
      strike_spare_counter[i] -= 1
    end
  end
end
