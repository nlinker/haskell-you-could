module Step4 where

-- Monads

--Левая идентичность:
--return a >>= k == k a
--Правая идентичность:
--m >>= return == m
--Ассоциативность:
--m >>= (\x -> k x >>= h) == (m >>= k) >>= h

class Monad m where
	return :: a -> m a
    (>>=) :: m a -> (a -> m b) -> m b