module Step2 where

-- скрываем стандартные определения, чтобы они нам мне мешали компилировать код
import Prelude hiding (Show)

-- # Про классы типов

-- классы типов — это совсем не то же самое, что классы в Джаве
-- можно использовать синоним "обобщённый интерфейс"
-- 1. определяют только абстрактный интерфейс
-- 2. позволяют создавать несколько независимых реализаций интерфейса ("инстансов")
-- 3. тип данных и инстансы классов типов независимы

-- обычно функции определяются так
myReverse [] = []
myReverse [a] = [a]
myReverse (x:xs) = myReverse xs ++ [x]

-- TODO откуда мы знаем, что элементы можно сравнивать?
-- TODO напишите тип elem1
elem1 x []     = False
elem1 x (y:ys) = x == y || elem1 x ys
-- elem1 x (y:ys) = x %=% y || elem1 x ys

-- случаи можно разбирать и выражением case ... of
-- выбор в данном случае - дело вкуса, на работу кода не влияет
elem2 x xs =
  case xs of
    []     -> False
    (y:ys) -> x %=% y || elem2 x ys

-- TODO попробуйте раскомментировать этот код (подсказка: будет ошибка, почему?)
-- data A = A1 | A2 | A3
-- test1 = elem2 A1 [A1,A2,A3]

-- Какой тип должен быть у elem2? Ну ясно, что `a->[a]->Bool`
-- но тогда и `(%=%)::a->a->Bool`
-- возникают 2 проблемы:
-- 1. Определён ли (%=%) вообще для всех типов?
-- 2. (%=%) должен быть по-разному определён для, например, Int и [a]
-- 3. Значения не знают, какие операции над ними будут совершать!

-- ограничение на тип-параметр
-- (%=%) :: (MyEq a) => a -> a -> Bool
-- elem2 :: (MyEq a) => a -> [a] -> Bool

class MyEq a where
  (%=%) :: a -> a -> Bool

instance MyEq Float where
  (%=%) x y =  x Prelude.== y

-- TODO write some function that use MyEq typeclass

class MyShow a where
  show :: a -> String

class MyRead a where
  read :: String -> a

class MyLogic a where
  (#&&) :: a -> a -> a
  (#||) :: a -> a -> a
  infixr 3 #&&
  infixr 3 #||

-- синтаксис определения функций может быть как префиксный,
-- так и инфиксный
instance MyLogic Bool where
  -- (#&&) :: Bool -> Bool -> Bool
  (#&&) True True = True
  (#&&) _    _    = False
  -- (#||) :: Bool -> Bool -> Bool
  False #|| False = False
  _     #|| _     = True


-- максимально обобщённый elem
-- elem3 :: (Foldable f, Eq a) => a -> f a -> Bool
-- elem3 x = foldr (\ y t -> x == y || t) False
