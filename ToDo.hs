-- p.185

import Control.Exception
import System.Environment
import System.Directory
import System.IO
import Data.List

main = do
    (command:argList) <- getArgs
    dispatch command argList

dispatch :: String -> [String] -> IO ()
dispatch "add"      = add
dispatch "view"     = view
dispatch "remove"   = remove

add :: [String] -> IO ()
add [] = putStrLn "error [] :: Please specify the file to add to, and the item to add."
add [s] = putStrLn "error [s] :: I need two arguments: file to add to, and item to add."
add [f,i,_] = putStrLn "error [f,i,_] :: Please, only one item at a time: file to add to, followed by one item to add."
add [fileName,todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [] = putStrLn "error [] :: Please specify a file to view."
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) 
                        [0..] todoTasks
    mapM_ putStrLn numberedTasks
    -- putStrLn unlines $ numberedTasks

remove :: [String] -> IO ()
remove [] = putStrLn "error [] :: I need two arguments: file to delete from, and item to delete."
remove [s] = putStrLn "error [s] :: I need two arguments: file to delete from, and item to delete."
remove [f,i,_] = putStrLn "error [f,i,_] :: Please, only one item at a time: file to remove from, followed by one item to remove."
remove [fileName, numberString] = do
    contents <- readFile fileName
    let todoTasks = lines contents
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks 
        newNumberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] newTodoItems
    putStrLn "These are your new TO-DO items: " 
    mapM putStrLn newNumberedTasks
    bracketOnError (openTempFile "." "temp")
        (\(tempName,tempHandle) -> do
            hClose tempHandle
            removeFile tempName)
        (\(tempName, tempHandle) -> do
            hPutStr tempHandle (unlines newTodoItems)
            hClose tempHandle
            removeFile "todo.txt"
            renameFile tempName "todo.txt")


