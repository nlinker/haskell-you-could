module Step4 where

import Text.Read (readMaybe)

-- Подготовка к монадам

-- чистые функции легко комбинировать

pureFloor :: Double -> Int
pureFloor x = floor x

pureGt :: Int -> Bool
pureGt y = y >= 0

pureShow :: Bool -> String
pureShow z = "pureShow => " ++ show z
-- all the chain
pureTest :: Double -> String
pureTest x = pureShow (pureGt (pureFloor x))
-- pureTest = pureShow . pureGt . pureFloor  -- point-free style

pureBind :: a -> (a -> b) -> b
pureBind x f = undefined  -- TODO

pureTest2 = undefined -- TODO то же самое, что  но используя pureBind

---------------------------------------------------
-- Логгирование в чистых функциях, омг
-- TODO напишите типы
loggableFloor x = (floor x,                      show x ++ " was floored \n")
loggableGt y    = (y >= 0,                       show y ++ " compared with 0 \n")
loggableShow z  = ("loggableShow => " ++ show z, show z ++ " converted to string\n")
-- как теперь их сочетать?
loggableTest :: Double -> (String, String)
loggableTest x = undefined -- TODO написать определение
-- подсказка для 2-х функций
-- test2 x =
--   let (x1, l1) = loggableFloor x in
--   let (x2, l2) = loggableGt x1 in
--   (x2, l1 ++ l2)

loggableBind :: (a, String) -> (a -> (b, String)) -> (b, String)
loggableBind x f = undefined -- TODO написать определение

loggableTest2 = undefined -- TODO то же самое, что  но используя loggableBind


---------------------------------------------------
-- TODO напишите типы
multivaluedFloor x = [floor x, ceiling x]
multivaluedGt y    = [y <= 0, y == 0, y >= 0]
multivaluedShow z  = ["<<<" ++ show z ++ ">>>"]

multivaluedTest :: Double -> [String]
multivaluedTest = undefined -- TODO написать определение
-- подсказка concat :: [[a]] -> [a]

---------------------------------------------------
-- функции readMaybe возвращают либо Nothing, либо Just x
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
