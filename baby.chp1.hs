

doubleMe x = x + x
doubleUs x y = x * 2 + y * 2
removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]
rightTriangles = [ (a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2]
--rightTriangles max = [ (a,b,c) | i <- max, c <- [1..i], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2]

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

