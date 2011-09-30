-- p.158

import Data.Char

main = do
    foo <- putStrLn "What's your last name?"
    lastName <- getLine
    bar <- putStrLn "What's your first name?"
    firstName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName  = map toUpper lastName
    putStrLn $ bigLastName ++ ".  " ++ bigFirstName ++ ", " ++ bigLastName ++ "."

