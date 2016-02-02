# 実行方法:
#   ruby answer_mura-s.rb 1224

ANS = 10.0
OPS = ['+', '-', '*', '/']

def patterns(n1, n2, n3, n4, op1, op2, op3)
  [
    "#{n1} #{op1} #{n2} #{op2} #{n3} #{op3} #{n4}",
    "(#{n1} #{op1} #{n2}) #{op2} #{n3} #{op3} #{n4}",
    "#{n1} #{op1} (#{n2} #{op2} #{n3}) #{op3} #{n4}",
    "#{n1} #{op1} #{n2} #{op2} (#{n3} #{op3} #{n4})",
    "(#{n1} #{op1} #{n2} #{op2} #{n3}) #{op3} #{n4}",
    "#{n1} #{op1} (#{n2} #{op2} #{n3} #{op3} #{n4})",
    "(#{n1} #{op1} #{n2} #{op2} #{n3} #{op3} #{n4})",
    "(#{n1} #{op1} #{n2}) #{op2} (#{n3} #{op3} #{n4})",
    "((#{n1} #{op1} #{n2}) #{op2} #{n3}) #{op3} #{n4}",
    "(#{n1} #{op1} (#{n2} #{op2} #{n3})) #{op3} #{n4}",
    "#{n1} #{op1} ((#{n2} #{op2} #{n3}) #{op3} #{n4})",
    "#{n1} #{op1} (#{n2} #{op2} (#{n3} #{op3} #{n4}))",
    "((#{n1} #{op1} #{n2}) #{op2} #{n3} #{op3} #{n4})",
    "(#{n1} #{op1} (#{n2} #{op2} #{n3}) #{op3} #{n4})",
    "(#{n1} #{op1} #{n2} #{op2} (#{n3} #{op3} #{n4}))",
    "((#{n1} #{op1} #{n2} #{op2} #{n3}) #{op3} #{n4})",
    "(#{n1} #{op1} (#{n2} #{op2} #{n3} #{op3} #{n4}))",
    "((#{n1} #{op1} #{n2}) #{op2} (#{n3} #{op3} #{n4}))",
    "(((#{n1} #{op1} #{n2}) #{op2} #{n3}) #{op3} #{n4})",
    "((#{n1} #{op1} (#{n2} #{op2} #{n3})) #{op3} #{n4})",
    "(#{n1} #{op1} ((#{n2} #{op2} #{n3}) #{op3} #{n4}))",
    "(#{n1} #{op1} (#{n2} #{op2} (#{n3} #{op3} #{n4})))"
  ]
end

def evalEachPatterns(n1, n2, n3, n4, op1, op2, op3)
  pats = []
  patterns(n1, n2, n3, n4, op1, op2, op3).each do |pat|
    pats << pat if eval(pat) == ANS
  end
  pats
end

def printResultArray(pats)
  pats.each { |pat| puts pat }
end

def main(num)
  n1, n2, n3, n4 = num.split('').map(&:to_f)
  for op1 in OPS do
    for op2 in OPS do
      for op3 in OPS do
        printResultArray(evalEachPatterns(n1, n2, n3, n4, op1, op2, op3))
      end
    end
  end
end

main(ARGV[0])
