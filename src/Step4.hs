module Step4 where

import Text.Read (readMaybe)

-- Подготовка к монадам

sumMaybe :: Maybe Integer
sumMaybe =
  case readMaybe "12" of
    Nothing -> Nothing
    Just x  ->
      case readMaybe "34" of
        Nothing -> Nothing
        Just y  ->
          case readMaybe "56" of
            Nothing -> Nothing
            Just z  -> Just (x + y + z)


add2 x = x + 2
mul2 y = y * 2
test1 x = do
  let result = add2 (mul2 x)  -- очень легко сочетаются
  print result

-- Но что если нам нужно вывести логи?
add2a x = (x, "added 2 to " ++ show x)
mul2a y = (y, "multiplied " ++ show y ++ " by 2")

-- как теперь их сочетать?
test2 x =
  let (x1, l1) = mul2a x in
  let (x2, l2) = add2a x1 in
  (x2, l1 ++ l2)
