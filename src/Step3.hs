module Step3 where

-- # Лямбдочки
-- Синоним для термина "анонимная функция"

test1 :: IO ()
test1 = do
  let xs = [1, 2, 3]
  let ys = map double xs
  print ys
  where
    double x = 2 * x

test2 :: IO ()
test2 = do
  let xs = [1, 2, 3]
  let ys = map double xs
  print ys
  where
    double = \x -> 2 * x  -- <- Различие здесь

------------------------------
-- (обратите внимание на подсказки haskell lint)

-- здесь мы явно описываем тип xs, иначе Haskell
-- не знает, что xs можно суммировать
-- TODO: опишите как можно более общий тип mySum
mySum = \xs -> sum (xs :: [Int])

-- TODO: опишите как можно более общий тип add42
add42 = \x -> x + 42

-- TODO: опишите как можно более общий тип omgAdd
-- TODO: как правильно расставить скобки?
omgAdd = \x -> \y -> x + y

-- TODO: опишите как можно более общий тип omgAdd5
omgAdd5 = \y -> 5 + y

-- TODO: опишите как можно более общий тип expr3
expr3 = \x y z -> x + y / z
