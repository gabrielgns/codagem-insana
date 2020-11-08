module FileFuncs
(
splitIt,
converteInteiro,
ordena,
somaEspaco,
excluiMenor,
mostraHanking
)
where
import System.IO
import Data.List
import System.Process

splitIt :: String -> [String]
splitIt palavra = words palavra

converteInteiro :: [String] -> [Int]
converteInteiro = map read

ordena :: [(Int,[Char])] -> [(Int,[Char])]
ordena lista = sort lista

excluiMenor :: [(Int,[Char])] -> [(Int,[Char])]
excluiMenor (x:xs) = xs

somaEspaco :: String -> String
somaEspaco frase = frase ++ " "

mostraHanking :: IO ()
mostraHanking = do
       conteudo <- readFile "rankingNumeros.txt"
       putStrLn conteudo
