module FuncoesArquivo
(
separa,
converteInteiro,
ordena,
somaEspaco,
excluiMenor,
mostraRanking
)
where
import System.IO
import Data.List
import System.Process

separa :: String -> [String]
separa palavra = words palavra

converteInteiro :: [String] -> [Int]
converteInteiro = map read

ordena :: [(Int,[Char])] -> [(Int,[Char])]
ordena lista = sort lista

excluiMenor :: [(Int,[Char])] -> [(Int,[Char])]
excluiMenor (x:xs) = xs

somaEspaco :: String -> String
somaEspaco frase = frase ++ " "

mostraRanking :: IO ()
mostraRanking = do
       conteudo <- readFile "Ranking/rankingNumeros.txt"
       putStrLn conteudo

--escreveNoRanking :: String -> String
--somaEspaco frase = frase ++ " "



