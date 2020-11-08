import System.Process
import System.IO
import Control.Monad
import Control.Concurrent 
import Data.Time
--import Data.String.Utils
import Data.List
import FileFuncs
import RandomFuncs
import Telas
import Pontuacao
import Cores
--import Menus

verificaPalavrasDigitadas :: [String] -> [String] -> [String]
verificaPalavrasDigitadas plvrDig plvrCorr
    | null plvrDig = [] 
    | indPlvrCorr == -1 = verificaPalavrasDigitadas (tail plvrDig) plvrCorr
    | indPlvrCorr /= -1 = [plvrCorr !! indPlvrCorr] ++ verificaPalavrasDigitadas (tail plvrDig) nvLista

    where
        indPlvrCorr = buscaIndice (head plvrDig) plvrCorr 0
        nvLista = [p | p <- plvrCorr, p /= (plvrCorr !! indPlvrCorr)]



buscaIndice :: String -> [String] -> Int -> Int
buscaIndice plvr lista ind
    | null lista = -1
    | head lista == plvr = ind
    | otherwise = buscaIndice plvr (tail lista) (ind + 1)

colorirPalavrasRound :: [String] -> String -> String
colorirPalavrasRound plvrCorr t
    | null plvrCorr = t
    | otherwise = colorirPalavrasRound (tail plvrCorr) (head $ substituir (head plvrCorr) (colorir (head plvrCorr) verde) t)



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

                    let palavrasPartida = [["pal1"], ["pal2", "pal3", "pal4"], ["pal5", "pal6", "pal7"]]
                    executarPartida palavrasPartida 0
                    main

        '2' -> do -- Ranking
            limparTela
            mostraRanking
            sair <- getChar
            main

        _ -> do -- Fechar o jogo
            system "clear"
            return ()

limparTela = do
    system "cls"
    system "clear"


executarPartida :: [[String]] -> Int -> IO ()
executarPartida palavras pontuacao = do
    if null palavras -- Partida acabou
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
            -- Execução do Round
            inicioRound <- getCurrentTime

            inputs <- forM palavrasRound (\a -> do
                limparTela
                putStr tela
                getLine)

            finalRound <- getCurrentTime
            let tempo = realToFrac (toRational(diffUTCTime finalRound inicioRound))

            -- Validação das palavras digitadas
            let palavrasCorretas = verificaPalavrasDigitadas inputs palavrasRound
                pontuacaoAtual = calculaPontos tempo dificuldade (length palavrasCorretas)
            limparTela
            putStr $ colorirPalavrasRound palavrasCorretas tela
            threadDelay 1000000 -- Dar tempo do player ver as palavras em verde

            -- Chamar próximo round
            executarPartida (tail palavras) (pontuacao + round pontuacaoAtual)
    where
        palavraBonus = palavrasBonus !! randomInt 0 9
        palavrasRound = case palavraBonus of "" -> head palavras
                                             _  -> head palavras ++ [palavraBonus]
        dificuldade = length (head palavras)

palavrasBonus = take 10 (cycle ["", colorir "Bonus" amarelo, ""])
