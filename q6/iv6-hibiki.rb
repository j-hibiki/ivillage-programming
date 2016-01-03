=begin
別表に書いたcase1を
rubyで実装していきます
=end

op1 = ""
op2 = ""
op3 = ""

nm1 = ""
nm2 = ""
nm3 = ""
nm4 = ""

nm = []
nm = [1,2,2,4]
op = ["+", "-", "×", "÷"]

def operate(num1, num2, enzanshi)
  if    enzanshi == "+"
    ans = num1 + num2
  elsif enzanshi == "-"
    ans = num1 - num2
  elsif enzanshi == "×"
    ans = num1 * num2
  else
    ans = num1 / num2
  end
  return ans
end

def calc_case1(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm1, nm2, op1)
  ans2 = operate(nm3, nm4, op3)
  ans3 = operate(ans1,ans2,op2)
  nm1 = nm1.to_i
  nm2 = nm2.to_i
  nm3 = nm3.to_i
  nm4 = nm4.to_i

  if ans3 == 10.0
    print "(",nm1,op1,nm2,")",op2,"(",nm3,op3,nm4,")=10\n"
    p "case1"
  end

  #test you
  #print "(",nm1,op1,nm2,")",op2,"(",nm3,op3,nm4,")=", ans3, "\n"

end

def calc_case2(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm1, nm2, op1)
  ans2 = operate(ans1,nm3, op2)
  ans3 = operate(ans2,nm4, op3)
  nm1 = nm1.to_i
  nm2 = nm2.to_i
  nm3 = nm3.to_i
  nm4 = nm4.to_i

  if ans3 == 10
    print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=10\n"
    p "case2"
  end

#print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=", ans3, "\n"

end

def calc_case3(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm3, nm4, op3)
  ans2 = operate(nm2, ans1,op2)
  ans3 = operate(nm1, ans2,op1)
  # nm1 = nm1.to_i
  # nm2 = nm2.to_i
  # nm3 = nm3.to_i
  # nm4 = nm4.to_i

  if ans3 == 10
    print nm1,op1,"(",nm2,op2,"(",nm3,op3,nm4,"))=10\n"
    p "case3"
  end

#print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=", ans3, "\n"

end

def calc_case4(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm2, nm3, op2)
  ans2 = operate(nm1, ans1,op1)
  ans3 = operate(ans2,nm4,op3)
  nm1 = nm1.to_i
  nm2 = nm2.to_i
  nm3 = nm3.to_i
  nm4 = nm4.to_i

  if ans3 == 10
    print "(",nm1,op1,"(",nm2,op2,nm3,"))",op3,nm4,"=10\n"
    p "case3"
  end

#print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=", ans3, "\n"

end

def calc_case5(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm2, nm3, op2)
  ans2 = operate(ans1,nm4, op3)
  ans3 = operate(nm1, ans2,op1)
  nm1 = nm1.to_i
  nm2 = nm2.to_i
  nm3 = nm3.to_i
  nm4 = nm4.to_i

  if ans3 == 10
    print nm1,op1,"((",nm2,op2,nm3,")",op3,nm4,")=10\n"
    p "case5"
  end

#print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=", ans3, "\n"

end


#最初のテスト用に書いたやーつ
=begin
op1 = "×"
op2 = "+"
op3 = "×"
=end

nm1 = 7
nm2 = 4
nm3 = 8
nm4 = 8

for place1 in 0..3  
  for place2 in 0..3
    for place3 in 0..3

      calc_case1(op[place1],op[place2],op[place3],nm1,nm2,nm3,nm4)
      calc_case2(op[place1],op[place2],op[place3],nm1,nm2,nm3,nm4)
      calc_case3(op[place1],op[place2],op[place3],nm1,nm2,nm3,nm4)
#calc_case4(op[place1],op[place2],op[place3],nm1,nm2,nm3,nm4)
#calc_case5(op[place1],op[place2],op[place3],nm1,nm2,nm3,nm4)

    end
  end
end




