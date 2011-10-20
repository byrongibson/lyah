-- http://blog.fogus.me/2011/06/03/10-haskell-one-liners-to-impress-your-friends/

-- 10 Haskell One Liners to Impress Your Friends
-- Jun 3, 2011

-- Following the meme (scala, ruby, clojure, python, f#, coffeescript, c#)

-- I would truly appreciate feedback from people whom actually know Haskell. As you may notice below, my grasp is not yet strong.
-- Multiple Each Item in a List by 2

map (*2) [1..10]

-- Sum a List of Numbers

foldl (+) 0 [1..1000]

-- or better

sum [1..1000]

-- Verify if Exists in a String

import Data.List
let wordlist = ["monad", "monoid", "Galois", "ghc", "SPJ"]
let tweet = "This is an example tweet talking about SPJ interviewing with Galois"

or $ map (flip isInfixOf tweet) wordlist

-- or better

any (flip isInfixOf tweet) wordlist

-- Read in a File

fileText <- readFile "data.txt"

let fileLines = lines fileText

-- or better

let fileLines = fmap lines $ readFile "data.txt"

-- Happy Birthday to You!

mapM_ putStrLn ["Happy Birthday " ++ (if x == 3 then "dear NAME" else "to You") | x <- [1..4]]

-- Filter list of numbers

let (passed, failed) = partition (>60) [49, 58, 76, 82, 88, 90]

-- Fetch and Parse an XML web service
-- this example needs the curl and xml packages. see RWH for info on installing them

import Network.Curl
import Text.XML.Light
import Control.Monad

let results = liftM parseXMLDoc $ liftM snd (curlGetString "http://search.twitter.com/search.atom?&q=haskell" [])

-- or better 

import Control.Applicative
let results = parseXMLDoc . snd <$> curlGetString "http://search.twitter.com/search.atom?&q=haskell" []

-- Find minimum (or maximum) in a List

foldl1 min [14, 35, -7, 46, 98]
foldl1 max [14, 35, -7, 46, 98]

-- or better

minimum [14, 35, -7, 46, 98] 
maximum [14, 35, -7, 46, 98]

-- Parallel Processing

-- this example needs the parallel package.

import Control.Parallel
import Control.Parallel.Strategies

parMap rseq (*2) [1..100]

-- Prime number generation

let pgen (p:xs) = p : pgen [x|x <- xs, x `mod` p > 0]

take 40 (pgen [2..])

