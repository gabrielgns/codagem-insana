import System.Process
import System.IO
import Control.Monad

import RandomFuncs
import Telas
import Pontuacao
import Cores
--import Menus


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
            let tela = gerarTelaRound palavras_atuais pontuacao
            inputs <- forM palavras_atuais (\a -> do
                limparTela
                putStr tela
                palavra <- getLine
                return palavra)
            let pontuacao_atual = calculaPontos tempo dificuldade palavras_corretas
            executarPartida (tail palavras) (pontuacao + round(pontuacao_atual))
    where
        palavras_atuais = head palavras
        dificuldade = length palavras_atuais
        tempo = 1 -- trocar pela funcao que calcula o tempo
        palavras_corretas = dificuldade  --trocar esse último pelo resultado da funcao que verifica os as palavras digitadas corretamente
