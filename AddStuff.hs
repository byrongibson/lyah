--p.311

import Control.Monad.Instances
import Control.Applicative
import Data.Monoid

addStuff :: Int -> Int
addStuff = do
    a <- (*2)
    b <- (+10)
    return (a+b)
