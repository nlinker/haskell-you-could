module Step2 where

import Prelude hiding (Eq)
import Step1 (RNA)

-- # Про классы типов

-- обычно функции определяются так
elem x []     = False
elem x (y:ys) = x==y || (elem x ys)

-- вызвать можно обычным образом
test1 = elem 1 [1,2,3]

-- Какой тип должен быть у elem? Ну ясно, что `a->[a]->Bool`
-- но тогда и `(==)::a->a->Bool`
-- возникают 2 проблемы:
-- 1. Определён ли (==) вообще для всех типов?
-- 2. (==) должен быть по-разному определён для например Int и [a]
-- 3. Значения не знают, какие операции над ними будут совершать!

class Eq a where 
  (==) :: a -> a -> Bool

-- ограничение на тип-параметр
-- (==) :: (Eq a) => a -> a -> Bool
-- elem :: (Eq a) => a -> [a] -> Bool


-- представим, что уже определены функции `integerEq` и `floatEq`
-- тогда можно было бы написать
-- instance Eq Integer where 
--  x == y = x `integerEq` y

-- instance Eq Float where
--  x == y =  x `floatEq` y

--data RNA = A | U | C | G
--    deriving (Read)

instance Eq RNA where
  (==) x y = undefined

