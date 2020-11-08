module RandomFuncs
(
randomInt,
randomWord,
easyRound,
mediumRound,
hardRound,
hardRoundGen,
createStage
)
where

import System.Random
import System.IO.Unsafe
--import Control.Monad (replicateM)

--numeros que determinam o range de numeros possiveis da saida
randomInt :: Int -> Int -> Int
randomInt x y = unsafePerformIO (getStdRandom (randomR (x, y)))

randomWord :: [String] -> String
randomWord [] = "None"
randomWord arr = arr !! (randomInt 0 ((length arr)-1))

easyRound :: [String] -> [String]
easyRound [] = ["None"]
easyRound arr = [arr !! (randomInt 0 ((length arr)-1))]

mediumRound :: [String] -> [String]
mediumRound [] = ["None"]
mediumRound arr = do
	let ret = []
	let ret1 = (arr !! (randomInt 0 ((length arr)-1))) : ret
	let ret2 = (arr !! (randomInt 0 ((length arr)-1))) : ret1
	return ret2 !! 0

hardRound :: [String] -> [String]
hardRound [] = ["None"]
hardRound arr = do
	let ret = []
	let ret1 = (arr !! (randomInt 0 ((length arr)-1))) : ret
	let ret2 = (arr !! (randomInt 0 ((length arr)-1))) : ret1
	let ret3 = (arr !! (randomInt 0 ((length arr)-1))) : ret2
	return ret3 !! 0

hardRoundGen :: [String] -> [[String]] -> [[String]]
hardRoundGen [] [[]]= [["None"]]
hardRoundGen arr setArr = do
	let array = setArr ++ [(hardRound arr)]
	let array1 = array ++ [(hardRound arr)]
	let array2 = array1 ++ [(hardRound arr)]
	return array2!!0

createStage :: [String] -> [[String]]
createStage [] = [["None"]]
createStage arr = do
	let array = []
	let array1 = hardRound arr : array
	let array2 = (hardRound arr): array1
	let array3 = (hardRound arr): array2
	let array4 = (hardRound arr): array3
	let array5 = (mediumRound arr): array4
	let array6 = (mediumRound arr): array5
	let array7 = (mediumRound arr): array6
	let array8 = (easyRound arr) : array7
	let array9 = (easyRound arr): array8 
	let array10 = (easyRound arr): array9
	return array10 !! 0