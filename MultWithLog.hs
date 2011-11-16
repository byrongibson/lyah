--p.303
--Need 'mtl' package for Control.Monad.Writer, included in Haskell Platform.  
--Dl'd Oneiric deb for Haskell Platform to bin/haskell, install w/ dpkg.  
--May want to uninstall and reinstall ghc7 first, into a single directory, 
--rather than spread out over /usr/local.
  

import Control.Monad.Writer

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got Number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    return (a*b)
