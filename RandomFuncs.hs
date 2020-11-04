module RandomFuncs
(randomInt,
randomWord,
easyRound,
mediumRound,
hardRound,
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

createStage :: [String] -> [[String]]
createStage [] = [["None"]]
createStage arr = do
	let mzr = []
	let mzr1 = hardRound arr : mzr
	let mzr2 = (hardRound arr): mzr1
	let mzr3 = (hardRound arr): mzr2
	let mzr4 = (hardRound arr): mzr3
	let mzr5 = (mediumRound arr): mzr4
	let mzr6 = (mediumRound arr): mzr5
	let mzr7 = (mediumRound arr): mzr6
	let mzr8 = (easyRound arr) : mzr7
	let mzr9 = (easyRound arr): mzr8 
	let mzr10 = (easyRound arr): mzr9
	return mzr10 !! 0