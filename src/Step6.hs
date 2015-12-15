module Step6 where

import Control.Monad
import Text.Read

sumMaybe :: Maybe Int
sumMaybe =
  readMaybe "12" >>= \a ->
    readMaybe "23" >>= \b ->
      readMaybe "34" >>= \c ->
        return (a + b + c)

-----------------------
-- синтаксический сахар
-----------------------
sumMaybe2 :: Maybe Int
sumMaybe2 = do
  a <- readMaybe "12"
  b <- readMaybe "23"
  c <- readMaybe "34"
  return (a + b + c)

testIO :: IO ()
testIO = do
  x <- getChar
  y <- getChar
  z <- getChar
  putStrLn [x,y,z]


myForever :: (Monad m) => m a -> m b
myForever a = undefined

mySequence_ :: (Monad m) => [m a] -> m ()
mySequence_ as = undefined
