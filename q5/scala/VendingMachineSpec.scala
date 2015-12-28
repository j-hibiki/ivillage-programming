package vending_machine

import org.specs2.Specification
import vending_machine.VendingMachine._
import vending_machine.Drink._
import scala.collection.mutable

class VendingMachineSpec extends Specification {
  def is = sequential ^ s2"""
  VendingMachine should
    初期状態ではColaが5個ある                      $e1
    (RedbullとWaterを投入)                         ${action(a1())}
    Cola 5個、Redbull 1個、Water 1個入っている     $e2
    1円は投入できない                              $e3
    5円は投入できない                              $e4
    10円を投入する                                 $e5
    50円を投入する                                 $e6
    現在60円入っている                             $e7
    お金を返金する                                 $e8
    現在1円も入っていない                          $e9
    (100円を投入)                                  ${action(a2())}
    Waterが購入可能リストに含まれる                $e10
    Waterは購入可能                                $e11
    Colaは購入不可                                 $e12
    Redbullは購入不可                              $e13
    (50円を投入)                                   ${action(a3())}
    ColaとWaterが購入可能リストに含まれる          $e14
    Colaは購入可能                                 $e15
    (100円を投入)                                  ${action(a4())}
    ColaとRedbullとWaterが購入可能リストに含まれる $e16
    Redbullは購入可能                              $e17
    現在250円入っている                            $e18
    Redbullを購入する                              $e19
    現在1円も入っていない                          $e20
    お金を返金する                                 $e21
    売上は200円である                              $e22
    Cola 5個、Redbull 0個、Water 1個入っている     $e23
                                                   """

  val machine = new VendingMachine

  def e1 = machine.stockInfo must_==
    mutable.LinkedHashMap(Cola.name -> mutable.Map(PriceSym -> Cola.price, StockSym -> 5))

  def a1() = {
    machine.stock(Redbull)
    machine.stock(Water)
  }

  def e2 = machine.stockInfo must_==
    mutable.LinkedHashMap(
      Cola.name -> mutable.Map(PriceSym -> Cola.price, StockSym -> 5),
      Redbull.name -> mutable.Map(PriceSym -> Redbull.price, StockSym -> 1),
      Water.name -> mutable.Map(PriceSym -> Water.price, StockSym -> 1)
    )

  def e3 = machine.intert(1) must_== "1 (Not available)"

  def e4 = machine.intert(5) must_== "5 (Not available)"

  def e5 = machine.intert(10) must_== "nil (OK)"

  def e6 = machine.intert(50) must_== "nil (OK)"

  def e7 = machine.total must_== 60

  def e8 = machine.refund must_== 60

  def e9 = machine.total must_== 0

  def a2() = machine.intert(100)

  def e10 = machine.purchasableDrinkNames must_== Array(Water.name)

  def e11 = machine.purchasable(Water.name) must beTrue

  def e12 = machine.purchasable(Cola.name) must beFalse

  def e13 = machine.purchasable(Redbull.name) must beFalse

  def a3() = machine.intert(50)

  def e14 = machine.purchasableDrinkNames must_== Array(Cola.name, Water.name)

  def e15 = machine.purchasable(Cola.name) must beTrue

  def a4() = machine.intert(100)

  def e16 = machine.purchasableDrinkNames must_==
    Array(Cola.name, Redbull.name, Water.name)

  def e17 = machine.purchasable(Redbull.name) must beTrue

  def e18 = machine.total must_== 250

  def e19 = machine.purchase(Redbull.name) must_==
    (s"<Drink: name=${Redbull.name.name}, price=${Redbull.price}>", 50)

  def e20 = machine.total must_== 0

  def e21 = machine.refund must_== 0

  def e22 = machine.salesAmount must_== 200

  def e23 = machine.stockInfo must_==
    mutable.LinkedHashMap(
      Cola.name -> mutable.Map(PriceSym -> Cola.price, StockSym -> 5),
      Redbull.name -> mutable.Map(PriceSym -> Redbull.price, StockSym -> 0),
      Water.name -> mutable.Map(PriceSym -> Water.price, StockSym -> 1)
    )
}
