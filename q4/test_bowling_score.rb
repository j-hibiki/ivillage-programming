require 'minitest/autorun'
require_relative 'YOUR_FILE_NAME'  # ex. require_relative 'answer_mura-s'

#
# このテストを実行して、全てのテストケースに成功するような、
# calc_scoreメソッドを実装してください。
#
# テストの実行方法：
#   ruby test_bowling_score.rb
#
# 各フレームのスコアは2次元の配列で与えられます。
# 値は-1 <= n <= 10で、-1の場合は投げなかったことを示し、
# それ以外は倒したピンの数です。
#
# スコア計算のポイント：
# - ストライクの場合は、次の2投の合計+10を加算する
# - スペアの場合は、次の1投+10を加算する
# - それ以外の場合は、1フレーム中で倒した本数を単純に加える
# - 10フレーム目は変則で、2投あるいは3投した合計をそのまま加算する
#
# また、以下のテストケースのコードも参照してみてください。
#
class TestBowlingScore < MiniTest::Test
  def test_no_spare_and_strike
    input = [
      [1, 5], [2, 7], [0, 0], [2, 4], [1, 0],
      [0, 0], [1, 2], [8, 1], [1, 2], [0, 0, -1]
    ]

    assert_equal(37, calc_score(input))
  end

  def test_include_spare_and_strike
    input = [
      [1, 5], [10, -1], [7, 3], [10, -1], [8, 0],
      [9, 1], [0, 10], [10, -1], [7, 2], [9, 0, -1]
    ]

    assert_equal(139, calc_score(input))
  end

  def test_perfect
    input = [
      [10, -1], [10, -1], [10, -1], [10, -1], [10, -1],
      [10, -1], [10, -1], [10, -1], [10, -1], [10, 10, 10]
    ]

    assert_equal(300, calc_score(input))
  end
end
