module Step1 where

-- # Про алгебраические типы данных и паттерн-матчинг

data Void                       -- ноль      ~ 0
data Unit = Unit                -- единица   ~ 1
data Add a b = AddL a | AddR b  -- сложение  ~ a + b
data Mul a b = Mul a b          -- умножение ~ ab

-- тьюплы - это тоже алгебраический тип

data X = X
data Port = Port Int
data Distance = DistMeters Double

data Maybe a = Just a | Nothing
data Either a b = Left a | Right b
data Tree a = Empty | Branch a (Tree a) (Tree a)

-- TODO определить список
-- data List a = ...

-- можно всякие функции определять
hehe :: Tree a -> String
hehe t = case t of
  Empty        -> "empty"
  Branch _ _ _ -> "not empty"
