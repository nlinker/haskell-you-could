module Step5 where

import Prelude hiding (Maybe, Just, Nothing, Monad(..), (>>=), return)
import qualified Text.Read as R

-- Monads --
------------

-- Монада это класс типов

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

-- Если мы говорим о конкретной монаде, например монаде Maybe
-- то это реализация (то есть instance) где реализация удовлетворяет
-- трём законам:

-- Левая идентичность:   return a >>= k  ==  k a
-- Правая идентичность:  m >>= return  ==  m
-- Ассоциативность:      m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h

data Maybe1 a = Just a | Nothing

instance Monad Maybe1 where
  return x = undefined      -- TODO реализовать это
  m >>= k = undefined       -- TODO реализовать это

-- Самая хардкорная имплементация!
readMaybe :: String -> Maybe1 Int
readMaybe s = case s of
  "12" -> Just 12
  "23" -> Just 23
  "34" -> Just 34
  _    -> Nothing

-- TODO попытайтесь исправить
sumMaybe :: Maybe1 Int
sumMaybe =
  readMaybe "12" >>= (\a ->
    readMaybe "23" >>= (\b ->
      readMaybe "34" >>= (\c ->
        return (a + b + c))))

bind :: Monad m => m a -> (a -> m b) -> m b
bind = (>>=)

--TODO перепишите sumMaybe с использованием функции bind (не оператора >>=)
sumMaybeViaBind :: Maybe1 Int
sumMaybeViaBind = bind (readMaybe "12") undefined

-- test1 = do
-- 	print sumMaybe
