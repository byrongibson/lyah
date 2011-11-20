--p.303
--Need 'mtl' package for Control.Monad.Writer, included in Haskell Platform.  
--Or, install GHC7 which includes Cabal, then dl Cabal-Install and run bootstrap.sh
--to install everything else, including mtl.
  

import Control.Monad.Writer

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    tell ["Gonna multiply these two"]
    return (a*b)


