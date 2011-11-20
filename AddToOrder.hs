--p.300

import Data.Monoid
import ApplyLog 

type Food = String
type Price = Sum Int

addDrink :: Food -> (Food,Price)
addDrink "beans" = ("milk",Sum 25)
addDrink "jerky" = ("whiskey",Sum 99)
addDrink _ = ("beer",Sum 30)


