module Step4 where

-- Monads

--����� ������������:
--return a >>= k == k a
--������ ������������:
--m >>= return == m
--���������������:
--m >>= (\x -> k x >>= h) == (m >>= k) >>= h

class Monad m where
	return :: a -> m a
    (>>=) :: m a -> (a -> m b) -> m b