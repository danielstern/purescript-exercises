module Main where
  
import Prelude
import Effect (Effect)
import Effect.Console
import Data.Array (insert, filter)

type Task = 
  {
    _id :: Int
  , title :: String
  , complete :: Boolean
  }

taskIdMatches :: Int -> Task -> Boolean
taskIdMatches id task = task._id == id

removeTaskById :: Array Task -> Int -> Array Task
removeTaskById tasks id = filter ( not taskIdMatches id ) tasks

completeTask :: Task -> Boolean -> Task
completeTask task complete = do
  { _id : task._id, title : task.title, complete}

completeTaskById :: Array Task -> Int -> Boolean -> Array Task
completeTaskById tasks id complete = do 
  tasks <#> \t -> if t._id == id then completeTask t complete else t

addTask :: Array Task -> Task -> Array Task
addTask tasks task = insert task tasks

newTask :: String -> Int -> Task
newTask _title _id = do
  let title = if _title == "" then "New task" else _title
  let complete = false
  { _id, title, complete }

main = do
  log "Run application in browser"