-- p.259

import Data.Monoid

lengthCompare :: String -> String -> Ordering
lengthCompare x y = (compare (length x) (length y)) `mappend` 
                    (compare (vowels x) (vowels y)) `mappend`
                    (compare x y)
    where vowels = length . filter (`elem` "aeiou")
          
