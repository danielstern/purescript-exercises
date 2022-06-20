module Main where
  
import Prelude
import Effect (Effect)
import Effect.Console
import Data.Maybe ( Maybe, fromMaybe )
import Matrix ( Matrix, repeat, modify, indexedMap, get )
import Rule ( rule )

field :: Int -> Int -> Int -> Int -> Matrix Int
field w h x1 y1 = do
  let a = repeat w h 0
  let b _ = 1
  let c = modify x1 y1 b a
  fromMaybe a c

neighbour :: Matrix Int -> Int -> Int -> Int -> Int -> Int
neighbour m x y dx dy = do
  let f1 a = fromMaybe 0 a
  let x2 = x + dx
  let y2 = y + dy
  let a = get x2 y2 m
  f1 a

next :: Matrix Int -> Int -> Int -> Int -> Int
next m x y a = do
  let f1 = neighbour m x y
  let c = f1 (-1) (0)
  let d = f1 (0) (-1)
  let e = f1 (1) (0)
  let f = f1 (0) (1)
  rule c d e f

nextField :: Matrix Int -> Matrix Int
nextField m = do 
  let f2 = next m 
  indexedMap f2 m

main = do
  log "Run application in browser"