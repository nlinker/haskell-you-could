module Main where

import Step1

main :: IO ()
main = decodeTest

decodeTest :: IO ()
decodeTest = do
    let str = "ACAUGUCAGUACGUAGCUAC"
    let rna :: [RNA]
        rna = map (\c -> read [c]) str
    let aminoAcids :: [AminoAcid]
        aminoAcids = decodeAll rna
    putStrLn (concatMap show aminoAcids)