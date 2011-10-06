-- p.193

{-module Randoms 
( main
, threeCoins
, finiteRandoms
) where-}

import System.Random

main = do
    gen <- newStdGen
    putStrLn $ take 20 (randomRs ('a','z') gen)
    {-gen' <- newStdGen
    putStrLn $ take 20 (randomRs ('a','z') gen')-}

threeCoins :: StdGen -> (Bool,Bool,Bool)
threeCoins gen = 
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen = 
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n - 1) newGen
    in  (value:restOfList, finalGen)


