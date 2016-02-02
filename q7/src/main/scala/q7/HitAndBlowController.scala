package q7

import scala.annotation.tailrec
import scala.util.Random
import scala.io.StdIn
import q7.HitAndBlowJudger._

class HitAndBlowController {

  private val ans = Random.shuffle(0 to 9).take(4)
  private val judger = new HitAndBlowJudger

  def start() = {
    @tailrec
    def startTurn(turn: Int): Unit = {
      if (overMaxTurn(turn)) {
        printLoseMessage()
        return
      }

      printInputMessage(turn)

      judger.validateInput(StdIn.readLine()) match {
        case Valid(input) =>
          val (hitNum, blowNum) = judger.judge(input, ans)
          printHitAndBlowNums(hitNum, blowNum)
          if (judger.isWin(hitNum)) printWinMessage()
          else startTurn(turn + 1)
        case InValid => startTurn(turn)
        case Quit => printQuitMessage()
      }
    }

    startTurn(1)
  }

  private def overMaxTurn(turn: Int): Boolean = turn > 10

  private def printInputMessage(turn: Int) = println(s"4桁の数字を入力してください。(${turn}ターン目)")

  private def printHitAndBlowNums(hitNum: Int, blowNum: Int) = println(s"${hitNum}H${blowNum}B")

  private def printQuitMessage() = println("Quit")

  private def printWinMessage() = println("You win!")

  private def printLoseMessage() = println("You lose!")
}
