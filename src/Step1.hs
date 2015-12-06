module Step1 where

-- # Про алгебраические типы данных и паттерн-матчинг

data Void                       -- ноль
data Unit = Unit                -- единица
data Add a b = AddL a | AddR b  -- сложение
data Mul a b = Mul a b          -- умножение

-- тьюплы - это тоже алгебраический тип

data X = X
data Port = Port Int
data Distance = DistMeters Double

data Maybe a = Just a | Nothing
data Either a b = Left a | Right b
data Tree a = Empty | Branch a (Tree a) (Tree a)

-- можно всякие функции определять
hehe :: Tree a -> String
hehe t = case t of
  Empty        -> "empty"
  Branch _ _ _ -> "not empty"
