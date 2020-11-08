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

converteInteiro :: [String] -> [Float]
converteInteiro = map read

ordena :: [(Float,[Char])] -> [(Float,[Char])]
ordena lista = sort lista

excluiMenor :: [(Float,[Char])] -> [(Float,[Char])]
excluiMenor (x:xs) = xs

somaEspaco :: String -> String
somaEspaco frase = frase ++ " "

mostraRanking :: IO ()
mostraRanking = do
       conteudo <- readFile "Ranking/rankingNumeros.txt"
       putStrLn conteudo

--escreveNoRanking :: String -> String
--somaEspaco frase = frase ++ " "



