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

diretorioLinguagens :: String
diretorioLinguagens = "Linguagens/linguagem"

linguagens :: [String]
linguagens = ["Python", "Haskell", "Java"]

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

            if fase `elem` ['A' .. 'z']
                then main
                else do
                    hSetBuffering stdin LineBuffering

                    -- Carregar palavras da linguagem
                    let linguagem = linguagens !! (read [fase]-1)
                        arquivoLinguagem = diretorioLinguagens ++ linguagem ++ ".txt"

                    conteudo <- readFile arquivoLinguagem
                    
                    let palavrasLinguagem = splitIt conteudo
                        palavrasPartida = createStage palavrasLinguagem
                    print palavrasPartida
                    limparTela

                    -- Executar Partida
                    executarPartida linguagem [(head palavrasPartida)] 0
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


executarPartida :: String -> [[String]] -> Int -> IO ()
executarPartida linguagem palavras pontuacao = do
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
            
            -- Executar, ou não, as funções da palavra bonus
            if "Bonus"`elem`inputs && palavraBonus /= ""
                then do
                    if randomInt 0 9 > 10 -- Executar funcão bônus
                        then executarPartida linguagem (tail palavras) (pontuacao + round pontuacaoAtual + 100000)

                    else do -- Executar funcão ônus (pular 3 rounds)
                        let restoPartida = drop 3 palavras
                            arquivoLinguagem = diretorioLinguagens ++ linguagem ++ ".txt"

                        limparTela
                        conteudo <- readFile arquivoLinguagem
                    
                        let palavrasLinguagem = splitIt conteudo
                            restoDaPartida = hardRoundGen palavrasLinguagem restoPartida
                        print restoDaPartida
                        getChar
                        -- Aqui continua a execucao com os rounds a mais
                        executarPartida linguagem restoDaPartida (pontuacao + round pontuacaoAtual)

            else do
                -- Chamar próximo round normalmente
                executarPartida linguagem (tail palavras) (pontuacao + round pontuacaoAtual)
    where
        palavraBonus = palavrasBonus !! randomInt 0 9
        palavrasRound = case palavraBonus of "" -> head palavras
                                             _  -> head palavras ++ [palavraBonus]
        dificuldade = length (head palavras)

palavrasBonus = take 10 (cycle ["", colorir "Bonus" amarelo, ""])
