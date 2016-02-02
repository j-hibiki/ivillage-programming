package vending_machine

class VendingMachine {

  import vending_machine.Drink._
  import vending_machine.VendingMachine._
  import scala.collection.mutable

  type DrinkInfo = mutable.Map[Symbol, Int]
  val stockInfo = mutable.LinkedHashMap[Symbol, DrinkInfo]()
  var total = 0
  var salesAmount = 0
  for (i <- 0 until 5) stock(Cola)

  def stock(drink: Drink): Unit = stockInfo.get(drink.name) match {
    case Some(dInfo) =>
      dInfo.put(StockSym, dInfo.get(StockSym).get + 1)
    case None =>
      stockInfo.put(drink.name, mutable.Map(PriceSym -> drink.price, StockSym -> 1))
  }

  def intert(money: Int): String =
    if (UsableMoney.contains(money)) {
      total += money
      "nil (OK)"
    } else s"$money (Not available)"

  def refund: Int = {
    val refundMoney = total
    total = 0
    refundMoney
  }

  def purchasableDrinkNames: Array[Symbol] = {
    val names = mutable.ArrayBuffer[Symbol]()
    stockInfo.foreach { case (s, dInfo) =>
      if (dInfo.get(StockSym).get > 0 && dInfo.get(PriceSym).get <= total) names += s
    }
    names.toArray
  }

  def purchasable(name: Symbol): Boolean = purchasableDrinkNames.contains(name)

  def purchase(name: Symbol): (String, Int) =
    if (purchasable(name)) {
      val dInfo = stockInfo.get(name).get
      dInfo.put(StockSym, dInfo.get(StockSym).get - 1)
      val price = dInfo.get(PriceSym).get
      val change = total - price
      salesAmount += price
      total = 0
      (s"<Drink: name=${name.name}, price=$price>", change)
    } else ("nil (Not purchasable)", 0)

}

object VendingMachine {
  val UsableMoney = Array(10, 50, 100, 500)
  val PriceSym = 'price
  val StockSym = 'stock
}

sealed trait Drink {
  val name: Symbol
  val price: Int
}

object Drink {

  case object Cola extends Drink {
    val name = 'cola
    val price = 120
  }

  case object Redbull extends Drink {
    val name = 'redbull
    val price = 200
  }

  case object Water extends Drink {
    val name = 'water
    val price = 100
  }

}