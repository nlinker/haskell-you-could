module Step5 where

import Prelude hiding (Maybe, Just, Nothing, Monad)

-- Monads --
------------

-- Монада это класс типов
class Monad m where
	return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

-- Если мы говорим о конкретной монаде, например монаде Maybe
-- то это реализация (то есть instance) где реализация удовлетворяет
-- трём законам:

--Левая идентичность:       return a >>= k  ==  k a
--Правая идентичность:        m >>= return  ==  m
--Ассоциативность: m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h

data Maybe a = Just a | Nothing

instance Monad Maybe where
	return x = undefined
	m >>= k = undefined

sumMaybe =
	let x = readMaybe "12" in
	let y0 = \y -> readMaybe "23" in
	let z0 = \z -> readMaybe "34" in
	x >>= y0 >>= z0

test1 = do
	print sumMaybe
