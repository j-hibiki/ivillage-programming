package q7

import scala.annotation.tailrec
import q7.HitAndBlowJudger._

class HitAndBlowJudger {

  def validateInput(input: String): ValidateResult = {
    val fourDigitPat = """(\d{4})""".r
    input match {
      case fourDigitPat(str) =>
        val inputNums = str.split("").map(_.toInt)
        if (validNum(inputNums)) Valid(inputNums)
        else InValid
      case "q" => Quit
      case _ => InValid
    }

  }

  def judge(input: Seq[Int], ans: Seq[Int]): (Int, Int) = {
    input.zip(ans).foldLeft((0, 0)) { case ((hitNum, blowNum), (inNum, ansNum)) =>
      if (inNum == ansNum) (hitNum + 1, blowNum)
      else if (ans.contains(inNum)) (hitNum, blowNum + 1)
      else (hitNum, blowNum)
    }
  }

  def isWin(hitNum: Int): Boolean = hitNum == 4

  @tailrec
  private def validNum(input: Seq[Int]): Boolean = input match {
    case h +: Nil => true
    case h +: t if t.contains(h) => false
    case h +: t => validNum(t)
  }

}

object HitAndBlowJudger {

  sealed trait ValidateResult {
    def input: Seq[Int]
  }

  case class Valid(input: Seq[Int]) extends ValidateResult

  object InValid extends ValidateResult {
    override def input = throw new UnsupportedOperationException
  }

  object Quit extends ValidateResult {
    override def input = throw new UnsupportedOperationException
  }

}
