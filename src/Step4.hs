module Step4 where

-- Подготовка к монадам

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


add_2 x = x + 2

mul_2 y = y * 2

test1 x = add_2 (mul_2 x)  -- очень легко сочетаются

-- Но что если нам нужно вывести логи?

add_2 x = (x, "added 2 to " ++ show x)

mul_2 y = (y, "multiplied " ++ show y ++ " by 2")

-- как теперь их сочетать?

test2 x =
  let (x1, l1) = mul_2 y in
  let (x2, l2) = add_2 x1 in
  (x2, l1 ++ l2)
