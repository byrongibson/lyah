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
-- dispatch "bump"  = bump
dispatch command    = errDNE command
--dispatch            = errNoArgs

-- Handle no arguments
-- Q: How do you represent no args in dispatch function above?  Tried "", [], _, blank space... all result in type error
errNoArgs :: IO ()
errNoArgs = putStrLn "You must enter a command: view | add | remove."

-- Handle malformed command argument
errDNE :: String -> [String] -> IO ()
errDNE command _ = putStrLn $ "The command '" ++ command ++ "' does not exist."

-- Add new todo item, one at a time
add :: [String] -> IO ()
add [fileName,todoItem] = appendFile fileName (todoItem ++ "\n")
add _ = putStrLn "error :: I need exactly two arguments: the file to add to, and the item to add."

-- View all todo items
view :: [String] -> IO ()
--view [] = putStrLn "error [] :: Please specify a file to view."
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) 
                        [0..] todoTasks
    mapM_ putStrLn numberedTasks
view _ = putStrLn "error :: I need exactly one argument: the file to view."

-- Delete a todo item and show the new todo list
remove :: [String] -> IO ()
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
remove _ = putStrLn "error :: I need exactly two arguments: the file to delete from, and the number of the item to delete."

-- Move the specified todo item to the top of the list
-- bump :: [String] -> IO ()
-- bump [fileName, numberString] = do ...
-- bump _ = putStrLn "error :: I need exactly two arguments: the todo list filename, and the number of the item to bump to the top."
