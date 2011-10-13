-- p.211

{-module ShortestPath 
( Section
, RoadSystem 
) where-}

import Data.List

data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)
data Label = A | B | C deriving (Show)

type RoadSystem = [Section]
type Path = [(Label,Int)]

-- test data
heathrowToLondon :: RoadSystem
heathrowToLondon =  [ Section 50 10 30
                    , Section 05 90 20
                    , Section 40 02 25
                    , Section 10 08 00 ]

main = do
    contents <- getContents
    let threes = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a,b,c] -> Section a b c ) threes
        path = optimalPath roadSystem
        pathString = concat $ map (show . fst) path
        pathTime = sum $ map snd path
    putStrLn $ "Shortest path: " ++ show pathString
    putStrLn $ "Time taken: " ++ show pathTime

-- step through path options, compare each route from current point to next point, store shortest
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) = 
    let timeA = sum (map snd pathA)
        timeB = sum (map snd pathB)
        forwardTimeToA = timeA + a
        crossTimeToA = timeB + b + c
        forwardTimeToB = timeB + b
        crossTimeToB = timeA + a + c
        newPathToA = if forwardTimeToA <= crossTimeToA
                        then (A, a):pathA
                        else (C, c):(B, b):pathB
        newPathToB = if forwardTimeToB <= crossTimeToB
                        then (B, b):pathB
                        else (C, c):(A, a):pathA
    in (newPathToA, newPathToB)

-- apply roadStep to input data 
optimalPath :: RoadSystem -> Path
optimalPath roadSystem = 
    let (bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
        then reverse bestAPath
        else reverse bestBPath

-- group a list into a list of lists of n (threes in this case)
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

