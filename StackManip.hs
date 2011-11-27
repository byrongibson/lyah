--p.317

module StackManip
( stackManip
) where

import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
--pop = state $ \(x:xs) -> (x,xs)
pop = do
    (x:xs) <- get
    put xs
    return x

push :: Int -> State Stack ()
--push a = state $ \xs -> ((), a:xs)
push x = do
    xs <- get
    put (x:xs) 

stackManip :: State Stack Int
stackManip = do
    push 3
    a <- pop
    pop

stackStuff :: State Stack () 
stackStuff = do
    a <- pop
    if a == 5
        then push 5
        else do
            push 3
            push 8

moreStack :: State Stack ()
moreStack = do
    a <- stackManip
    if a == 100
        then stackStuff
        else return ()


