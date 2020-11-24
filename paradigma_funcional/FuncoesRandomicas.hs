module FuncoesRandomicas
(
inteiroAleatorio,
palavraAleatoria,
roundFacil,
roundMedio,
roundDificil,
roundDificilGen,
createStage
)
where

import System.Random
import System.IO.Unsafe
--import Control.Monad (replicateM)

--numeros que determinam o range de numeros possiveis da saida
inteiroAleatorio :: Int -> Int -> Int
inteiroAleatorio x y = unsafePerformIO (getStdRandom (randomR (x, y)))

palavraAleatoria :: [String] -> String
palavraAleatoria [] = "None"
palavraAleatoria arr = arr !! (inteiroAleatorio 0 ((length arr)-1))

roundFacil :: [String] -> [String]
roundFacil [] = ["None"]
roundFacil arr = [arr !! (inteiroAleatorio 0 ((length arr)-1))]

roundMedio :: [String] -> [String]
roundMedio [] = ["None"]
roundMedio arr = do
	let ret = []
	let ret1 = (arr !! (inteiroAleatorio 0 ((length arr)-1))) : ret
	let ret2 = (arr !! (inteiroAleatorio 0 ((length arr)-1))) : ret1
	return ret2 !! 0

roundDificil :: [String] -> [String]
roundDificil [] = ["None"]
roundDificil arr = do
	let ret = []
	let ret1 = (arr !! (inteiroAleatorio 0 ((length arr)-1))) : ret
	let ret2 = (arr !! (inteiroAleatorio 0 ((length arr)-1))) : ret1
	let ret3 = (arr !! (inteiroAleatorio 0 ((length arr)-1))) : ret2
	return ret3 !! 0

roundDificilGen :: [String] -> [[String]] -> [[String]]
roundDificilGen [] [[]]= [["None"]]
roundDificilGen arr setArr = do
	let array = setArr ++ [(roundDificil arr)]
	let array1 = array ++ [(roundDificil arr)]
	let array2 = array1 ++ [(roundDificil arr)]
	return array2!!0

createStage :: [String] -> [[String]]
createStage [] = [["None"]]
createStage arr = do
	let array = []
	let array1 = roundDificil arr : array
	let array2 = (roundDificil arr): array1
	let array3 = (roundDificil arr): array2
	let array4 = (roundDificil arr): array3
	let array5 = (roundMedio arr): array4
	let array6 = (roundMedio arr): array5
	let array7 = (roundMedio arr): array6
	let array8 = (roundFacil arr) : array7
	let array9 = (roundFacil arr): array8 
	let array10 = (roundFacil arr): array9
	return array10 !! 0