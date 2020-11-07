import System.Process
import System.IO
import Control.Monad

import RandomFuncs
import Telas
import Pontuacao
import Cores

cleanScreen = do
    system "cls"
    system "clear"

executarPartida :: [[String]] -> Int -> IO ()
executarPartida palavras pontuacao = do
    if palavras == []
        then do
            cleanScreen
            putStrLn("Pontuação Final: " ++ show pontuacao)
        else do
            let tela = gerarTelaRound palavras_atuais pontuacao
            inputs <- forM palavras_atuais (\a -> do
                cleanScreen
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


main = do
    cleanScreen

    putStr menuPrincipal
    input <- getLine
    cleanScreen

    if input == "1"
        then do
            putStr menuSelecaoFase
            ipt <- getLine
            if ipt == "1"
                then do
                    cleanScreen
                    executarPartida [["palavra1"], ["palvra2", "asasdasdasdasd"]] 0


                else putStrLn "testes3"
        else do
            print "teste"
