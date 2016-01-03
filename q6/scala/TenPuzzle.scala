package mura_s

import com.twitter.util.Eval

object TenPuzzle {
  val ans = 10.0
  val ops = Array('+', '-', '*', '/')

  def main(args: Array[String]): Unit = {
    require(args.length == 1 && args(0).matches( """\d{4}"""),
      "4桁の値を1つ引数に渡してください。")

    val Array(n1, n2, n3, n4) = args(0).split("").map(_.toDouble)
    for (op1 <- ops; op2 <- ops; op3 <- ops;
         strOpt <- evalEachPatterns(n1, n2, n3, n4, op1, op2, op3)) {
      printResult(strOpt)
    }
  }

  def evalEachPatterns(n1: Double, n2: Double, n3: Double, n4: Double,
                       op1: Char, op2: Char, op3: Char): Array[Option[String]] =
    patterns(n1, n2, n3, n4, op1, op2, op3).map { pat =>
      if ((new Eval).apply[Double](pat) == ans) Some(pat) else None
    }

  def patterns(n1: Double, n2: Double, n3: Double, n4: Double,
               op1: Char, op2: Char, op3: Char): Array[String] = Array(
    // 括弧なし
    s"$n1 $op1 $n2 $op2 $n3 $op3 $n4",
    // 括弧1つ
    s"($n1 $op1 $n2) $op2 $n3 $op3 $n4",
    s"$n1 $op1 ($n2 $op2 $n3) $op3 $n4",
    s"$n1 $op1 $n2 $op2 ($n3 $op3 $n4)",
    s"($n1 $op1 $n2 $op2 $n3) $op3 $n4",
    s"$n1 $op1 ($n2 $op2 $n3 $op3 $n4)",
    s"($n1 $op1 $n2 $op2 $n3 $op3 $n4)",
    // 括弧2つ
    s"($n1 $op1 $n2) $op2 ($n3 $op3 $n4)",
    s"(($n1 $op1 $n2) $op2 $n3) $op3 $n4",
    s"($n1 $op1 ($n2 $op2 $n3)) $op3 $n4",
    s"$n1 $op1 (($n2 $op2 $n3) $op3 $n4)",
    s"$n1 $op1 ($n2 $op2 ($n3 $op3 $n4))",
    s"(($n1 $op1 $n2) $op2 $n3 $op3 $n4)",
    s"($n1 $op1 ($n2 $op2 $n3) $op3 $n4)",
    s"($n1 $op1 $n2 $op2 ($n3 $op3 $n4))",
    s"(($n1 $op1 $n2 $op2 $n3) $op3 $n4)",
    s"($n1 $op1 ($n2 $op2 $n3 $op3 $n4))",
    // 括弧3つ
    s"(($n1 $op1 $n2) $op2 ($n3 $op3 $n4))",
    s"((($n1 $op1 $n2) $op2 $n3) $op3 $n4)",
    s"(($n1 $op1 ($n2 $op2 $n3)) $op3 $n4)",
    s"($n1 $op1 (($n2 $op2 $n3) $op3 $n4))",
    s"($n1 $op1 ($n2 $op2 ($n3 $op3 $n4)))"
  )

  def printResult(strOpt: Option[String]): Unit = strOpt match {
    case Some(s) => println(s)
    case None => ()
  }
}