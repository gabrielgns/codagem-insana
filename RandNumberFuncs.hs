module RandNumberFuncs
(randNumberR,
setOfIntegerRN,
setOfFloatRN
)
where

import System.Random
import Control.Monad

--numeros que determinam o range de numeros possiveis da saida
randNumberR :: (Integer,Integer) -> IO Integer
randNumberR (k,n) = randomRIO (k, n-1)

--quantidade de numeros na lista de numeros aleatorios
setOfIntegerRN :: Int -> IO [Integer]
setOfIntegerRN n = replicateM n (randomIO ::IO Integer)

--quantidade de numeros na lista de numeros aleatorios
setOfFloatRN :: Int -> IO [Float]
setOfFloatRN n = replicateM n (randomIO :: IO Float)