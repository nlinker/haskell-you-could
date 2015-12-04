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
-- Какие типы у этих функций?

sum4 = \xs -> sum xs

add_42 = \x -> x + 42

-- Как правильно расставить скобки?
omg_add = \x -> \y -> x + y

sum3 = \x y z -> x + y + z
