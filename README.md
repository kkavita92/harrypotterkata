# Harry Potter Kata

First attempt in Ruby

```
__
HH
HH
BBB       HH                                        ,z.
=== .___. HH     %%%%                   .o.       ,zZZZ>
BBB |   | HH 838 \\\\ EEE    AAAAA     ,0X0'    ,zZZZ"
BBB |<<<| HH 838 %%%% EEE ## DDDDD    ,0X0'   ,zZZZ"
BBB | E | HH 838 %GR% +++ ## AAAAA   ,0X0'  ,zZZZ"
BBB | M | HH 838 %%%% EEE ## <<v>>  ,0X0' ,zZZZ"
BBB | C | HH 838 %%%% EEE ## AAAAA ,0X0',zZZZ"HH$HHHHHHHDDHH$HH
=== |<<<| HH 838 //// EEE ## AAAAA.0X0;zZZZ"  EE$EEEEEEEDDEE$EE
BBB |___| HH 838 %%%% EEE ## AAAAA'"0' "Z"    HH$HHHHHHHDDHH$HH

```

## Problem

Once upon a time there was a series of 5 books about a very English hero called Harry. (At least when this Kata was invented, there were only 5. Since then they have multiplied) Children all over the world thought he was fantastic, and, of course, so did the publisher. So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following pricing model to take advantage of Harry’s magical powers.

One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series, you get a 5% discount on those two books. If you buy 3 different books, you get a 10% discount. With 4 different books, you get a 20% discount. If you go the whole hog, and buy all 5, you get a huge 25% discount.

Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set, but the fourth book still costs 8 EUR.

Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with shopping baskets overflowing with Potter books. Your mission is to write a piece of code to calculate the price of any conceivable shopping basket, giving as big a discount as possible.

From http://codingdojo.org/kata/potter/

## My Approach

* Do simple basket case first - all same books
* Do complex baskets - different combinations of books
* Remove edge cases - baskets of 5,3 combinations
* Refactoring / Class extraction from original ```Calculator``` class

## Reflection

This was a lot more challenging than I anticipated! However, once I did manage to crack the discount optimisation algorithm, the path forward was definitely more straightforward.

In previous instances, I've tended to overthink class extraction from the outset and end up trying to plan all the classes I need from the start. This usually makes things a lot more complicated because I am trying to refactor as I code rather than focusing on solving the problem at hand and then moving on to cleaning everything up.

Thankfully, the optimisation problem was frustrating enough for me to avoid this pitfall. All of my initial solution was done in the poorly named ```Calculator``` class after which I began pulling out a lot of the logic into separate classes. I also replaced an array type with ```DiscountableSetList``` class after realising I was doing a lot of array manipulation on this one single array and it would be better of making it into a class with methods that would do the modifying and checking.

In terms of struggles....tbc

## Pending
* Increase test breadth by adding more possibilities for baskets -> all combination of books (is this necessary?)
* Better naming for DiscountableSetList class and methods
* Possible refactoring of MaximumDiscountFinder -> currently too clunky and possibly defying SRP
* Correct 0.000001 bug affecting [4, 4, num] sets => [21.6, 25.6, 25.6].reduce(:+) returns 72.80000001 instead of 72.8
* Complete README
