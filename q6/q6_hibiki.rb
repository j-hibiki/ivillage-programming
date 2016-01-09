##############################################
# ivillage-programming   
# programming exercises  
# quenstion 6            
# j-hibiki               
##############################################

nm1 = 4
nm2 = 7
nm3 = 2
nm4 = 4

ANS = 10
OPS = ["+", "-", "×", "÷"]

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
  if ans3 == ANS
    print "(",nm1,op1,nm2,")",op2,"(",nm3,op3,nm4,")=10\n"
  end
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
  if ans3 == ANS
    print "((",nm1,op1,nm2,")",op2,nm3,")",op3,nm4,"=10\n"
  end
end

def calc_case3(op1,op2,op3,nm1,nm2,nm3,nm4)
  nm1 = nm1.to_f
  nm2 = nm2.to_f
  nm3 = nm3.to_f
  nm4 = nm4.to_f
  ans1 = operate(nm3, nm4, op3)
  ans2 = operate(nm2, ans1,op2)
  ans3 = operate(nm1, ans2,op1)
  nm1 = nm1.to_i
  nm2 = nm2.to_i
  nm3 = nm3.to_i
  nm4 = nm4.to_i
  if ans3 == ANS
    print nm1,op1,"(",nm2,op2,"(",nm3,op3,nm4,"))=10\n"
  end
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
  if ans3 == ANS
    print "(",nm1,op1,"(",nm2,op2,nm3,"))",op3,nm4,"=10\n"
  end
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
  if ans3 == ANS
    print nm1,op1,"((",nm2,op2,nm3,")",op3,nm4,")=10\n"
  end
end

for place1 in 0..3  
  for place2 in 0..3
    for place3 in 0..3
      calc_case1(OPS[place1],OPS[place2],OPS[place3],nm1,nm2,nm3,nm4)
      calc_case2(OPS[place1],OPS[place2],OPS[place3],nm1,nm2,nm3,nm4)
      calc_case3(OPS[place1],OPS[place2],OPS[place3],nm1,nm2,nm3,nm4)
      calc_case4(OPS[place1],OPS[place2],OPS[place3],nm1,nm2,nm3,nm4)
      calc_case5(OPS[place1],OPS[place2],OPS[place3],nm1,nm2,nm3,nm4)
    end
  end
end