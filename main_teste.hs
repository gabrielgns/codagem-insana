import System.Process
import System.IO
import Control.Monad
--import Data.String.Utils
import Data.List

import RandomFuncs
import Telas
import Pontuacao
import Cores
--import Menus

verificaPalavras :: [String] -> String -> Bool
verificaPalavras [] digitada = True
verificaPalavras (h:t) digitada = 
    if palavraCorreta h digitada then True
    else verificaPalavras t digitada

palavraCorreta :: String -> String -> Bool
palavraCorreta palavraJogo palavraUser 
    | palavraJogo == palavraUser = True
    | otherwise = False


main :: IO ()
main = do
    -- Mostrar Menu Principal
    hSetBuffering stdin NoBuffering
    limparTela
    putStr menuPrincipal
    comando <- getChar

    case comando of
        '1' -> do -- Selecionar Fase
            limparTela
            putStr menuSelecaoFase
            fase <- getChar

            if fase == 'q'
                then main
                else do
                    hSetBuffering stdin LineBuffering
                    {-
                    1. Ler palavras da linguagem
                    let palavrasLinguagem = carregarPalavrasLinguagem (linguagens !! (read fase))

                    2. Selecionar palavras aleatórias a serem usadas na partida
                    let palavrasPartida = chamar funcao de sortear as palavras
                    -}

                    let palavrasPartida = [["pal1"], ["pal2", "pal3"], ["pal4", "pal5", "pal6"]]

                    executarPartida palavrasPartida 0
                    main

        '2' -> do -- Ranking
            limparTela
            putStrLn "Ranking aqui"

        _ -> do -- Fechar o jogo
            system "clear"
            return ()

limparTela = do
    system "cls"
    system "clear"


executarPartida :: [[String]] -> Int -> IO ()
executarPartida palavras pontuacao = do
    if palavras == []
        then do
            limparTela
            putStrLn("Pontuação Final: " ++ show pontuacao)
            {-
            1. Verificar se a pontuação é suficiente para entrar
            no ranking
            2. Pedir (ou não) o nome do jogador e salvar a pontuacao
            -}
        else do
            let tela = gerarTelaRound palavrasRound pontuacao
            inputs <- forM palavrasRound (\a -> do
                limparTela
                putStr tela
                palavra <- getLine
                return palavra)
            let pontuacao_atual = calculaPontos tempo dificuldade palavrasCorretas
            executarPartida (tail palavras) (pontuacao + round(pontuacao_atual))
    where
        palavraBonus = palavrasBonus !! (randomInt 0 9)
        palavrasRound = case palavraBonus of "" -> head palavras
                                             _  -> head palavras ++ [palavraBonus]


        dificuldade = length (head palavras)
        tempo = 1 -- trocar pela funcao que calcula o tempo
        palavrasCorretas = dificuldade  --trocar esse último pelo resultado da funcao que verifica os as palavras digitadas corretamente

palavrasBonus = take 10 (cycle (["", colorir "Bonus" amarelo, ""]))

{-
sortearPalavraBonus = do
    case (toInteger(randomInt 0 10) `mod` 2) of
        1 -> colorir "bonus" amarelo
        0 -> colorir "bonus2" amarelo
        _ -> ""
-}
