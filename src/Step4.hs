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

pureChain1 :: Double -> Int
pureChain1 x1 = pureBind x1 pureFloor

pureChain1a :: Double -> Int
pureChain1a x1 = pureBind x1 (\x -> pureFloor x)

pureChain1b :: Double -> Int
pureChain1b x1 = pureBind x1 (\x -> pureBind (pureFloor x) id)

---------------------------------
-- добавим ещё один шаг к цепочку
pureChain2 :: Double -> Bool
pureChain2 x1 = pureBind x1 (\x ->
  pureBind (pureFloor x) (\y ->
    pureBind (pureGt y) id))

---------------------------------
-- добавим последний шаг к цепочку
-- TODO fix compilation error
-- pureChain3 :: Double -> String
-- pureChain3 x1 = pureBind x1 (\x ->
--   pureBind (pureFloor x) (\y ->
--     pureBind (pureGt y) id))

---------------------------------------------------
-- Логгирование в чистых функциях, омг
-- TODO напишите типы
logFloor x = (floor x,                  show x ++ " was floored \n")
logGt y    = (y >= 0,                   show y ++ " compared with 0 \n")
logShow z  = ("<<<" ++ show z ++ ">>>", show z ++ " converted to string\n")
-- как теперь их сочетать?
logChain3a :: Double -> (String, String)
logChain3a x = undefined -- TODO написать определение
-- подсказка для 2-х функций
-- test2 x =
--   let (x1, l1) = loggableFloor x in
--   let (x2, l2) = loggableGt x1 in
--   (x2, l1 ++ l2)

logBind :: (a, String) -> (a -> (b, String)) -> (b, String)
logBind x f = undefined -- TODO написать определение

logChain3b = undefined -- TODO то же самое, что  но используя logBind

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
