-- p.174

main = interact palindromeChecker

palindromeChecker :: String -> String
palindromeChecker = 
    unlines .
    map (\xs -> if isPal xs then "palindrome" else "not palindrome") .
    lines

isPal :: String -> Bool
isPal xs = xs == reverse xs
    
