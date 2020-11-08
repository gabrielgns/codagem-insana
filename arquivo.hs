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

mostraRanking :: IO ()
mostraRanking = do
       conteudo <- readFile "rankingNumeros.txt"
       putStrLn conteudo


main :: IO ()
main = do 
       -- Leitura Python
       conteudo <- readFile "Linguagens/linguagemPython.txt"
       let listaPython = splitIt conteudo

       -- Leitura Java
       conteudo <- readFile "Linguagens/linguagemJava.txt"
       let listaJava = splitIt conteudo

       -- Leitura Haskell
       conteudo <- readFile "Linguagens/linguagemHaskell.txt"
       let listaHaskell = splitIt conteudo
	
       -- Leitura Cpp
       conteudo <- readFile "Linguagens/linguagemCpp.txt"
       let listaCpp = splitIt conteudo

       -- Ranking
       conteudo <- readFile "numeros.txt"

       let l = splitIt conteudo
       let inteiro = converteInteiro l
       let valorNovo = 7                         --  pontuação nova
       let novoNome = "DEU"                      --  nome da pessoa com a nova pontuação

       let novaListaInteiros = valorNovo : inteiro

       conteudo <- readFile "nomes.txt"

       let listaNomes = splitIt conteudo
       let novaListaNomes = novoNome : listaNomes 

       print listaNomes
       callCommand "clear"

       let rankingDesordenado = zip novaListaInteiros novaListaNomes

       let rankingOrdenado = ordena rankingDesordenado
       let rankingAtualizado = excluiMenor rankingOrdenado

       let tuplaUm = rankingAtualizado !!0
       let tuplaDois = rankingAtualizado !!1
       let tuplaTres = rankingAtualizado !!2

       let nomeTres = snd tuplaTres
       let nomeDois = snd tuplaDois
       let nomeUm = snd tuplaUm

       let valorTres = fst tuplaTres
       let valorDois = fst tuplaDois
       let valorUm = fst tuplaUm

       let nomeEspacoTres = somaEspaco nomeTres
       let nomeEspacoDois = somaEspaco nomeDois

       let valorTresEspaco = somaEspaco (show valorTres)
       let valorDoisEspaco = somaEspaco (show valorDois)

       writeFile "nomes.txt" nomeEspacoTres
       appendFile "nomes.txt" nomeEspacoDois
       appendFile "nomes.txt" nomeUm

       writeFile "numeros.txt" valorTresEspaco
       appendFile "numeros.txt" valorDoisEspaco
       appendFile "numeros.txt" (show valorUm)

       writeFile "rankingNumeros.txt" "Ranking: \n"
       appendFile "rankingNumeros.txt" ("1. " ++ nomeTres)
       appendFile "rankingNumeros.txt" (" ------------ " ++ (show valorTres) ++ " Pontos")
       appendFile "rankingNumeros.txt" ("\n2. " ++ nomeDois)
       appendFile "rankingNumeros.txt" (" ------------ " ++ (show valorDois) ++ " Pontos")
       appendFile "rankingNumeros.txt" ("\n3. " ++ nomeUm)
       appendFile "rankingNumeros.txt" (" ------------ " ++ (show valorUm) ++ " Pontos")

