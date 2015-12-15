module Step5 where

import Prelude hiding (Monad(..), (>>=), return)
import qualified Text.Read as R

-- Monads --
------------

-- Монада это класс типов

class Monad m where
  return :: a -> m a

  bind :: m a -> (a -> m b) -> m b
  bind = (>>=)

  (>>=) :: m a -> (a -> m b) -> m b
  (>>=) = bind
  infixl 1 >>=

-- Если мы говорим о конкретной монаде, например монаде Option
-- то это реализация (то есть instance) где реализация удовлетворяет
-- трём законам:

-- в терминах оператора
-- Левая идентичность:   return a >>= k  ==  k a
-- Правая идентичность:  m >>= return  ==  m
-- Ассоциативность:      m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h

-- в терминах функции
-- Левая идентичность:   bind (return a) k  ==  k a
-- Правая идентичность:  bind m return  ==  m
-- Ассоциативность:      bind m (\x -> bind (k x) h)  ==  bind (bind m k) h

data Loggable a = Log a String

instance Monad Loggable where
  return x = undefined     -- TODO реализовать это
  m >>= k = undefined      -- TODO реализовать это

-- TODO перепишите loggable функции с использованием типа Loggable
-- loggableFloor x = (floor x,                      show x ++ " was floored \n")
-- loggableGt y    = (y >= 0,                       show y ++ " compared with 0 \n")
-- loggableShow z  = ("loggableShow => " ++ show z, show z ++ " converted to string\n")

loggableSuperTest :: Double -> Loggable String
loggableSuperTest x = return x >>= undefined -- TODO как обычно

data Option a = Some a | None

instance Monad Option where
  return x = undefined      -- TODO реализовать это
  m >>= k = undefined       -- TODO реализовать это

-- Самая хардкорная имплементация!
readOpt :: String -> Option Int
readOpt s =
  case R.readMaybe s of
    Just x -> Some x
    _      -> None

-- считаем сумму опциональных значений
sumOpt :: Option Int
sumOpt =
  bind (readOpt "12") (\a ->
    bind (readOpt "23") (\b ->
      bind (readOpt "34") (\c ->
        return (a + b + c))))


--TODO перепишите sumMaybe с использованием функции bind (не оператора >>=)
sumMaybeViaBind :: Option Int
sumMaybeViaBind = readOpt "12" >>= undefined

-- test1 = do
-- 	print sumMaybe
