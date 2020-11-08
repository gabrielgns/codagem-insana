import Cores
import Pontuacao
import RandomFuncs
import Telas
import FileFuncs
import System.Process
import System.IO
import Control.Concurrent
import Text.Printf 
import Data.Time


cleanScreen = do
    system "cls"
    system "clear"


main = do
    
    {- Teste de Cores
    putStrLn "Teste de Cores"
    putStrLn (colorir "Teste" fundoAzul)
    putStrLn (colorir "Outra linha" verde)
    print (colorir "nao funciona se usar print" vermelho)
    -}
  -- Mostrar Menu Principal
    hSetBuffering stdin NoBuffering
    cleanScreen
    putStr menuPrincipal
    comando <- getChar

    case comando of
        '1' -> do -- Selecionar Fase

            cleanScreen
            putStr menuSelecaoFase
            ipt <- getLine

            if ipt == "q"
                then main
                else do 
                    hSetBuffering stdin LineBuffering

                    if ipt == "1"
                        then do
                            cleanScreen
                            
                            conteudo <- readFile "Linguagens/linguagemPython.txt"
                            let listaPython = splitIt conteudo
                            let fasePython = createStage listaPython
                            print fasePython
                            callCommand "clear"
                            --rounds faceis
                            let roundFacil = fasePython !! 0
                            let roundFacil1 = fasePython !! 1
                            let roundFacil2 = fasePython !! 2
                            --rounds normais
                            let roundMedio = fasePython !! 3
                            let roundMedio1 = fasePython !! 4
                            let roundMedio2 = fasePython !! 5
                            --rounds dificeis
                            let roundDificil = fasePython !! 6
                            let roundDificil1 = fasePython !! 7
                            let roundDificil2 = fasePython !! 8
                            let roundDificil3 = fasePython !! 9
                            --Comandos abaixo cria o roud extra, caso o user seja sorteado com palavra BONUS 
                            {-
                            let faseExtra = hardRoundGen listaPython fasePython
                            let roundDificilExtra = faseExtra !! 8
                            let roundDificilExtra = faseExtra !! 9
                            let roundDificilExtra = faseExtra !! 10
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis

                            let telaPalavras = gerarTelaRound roundFacil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundFacil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundFacil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)
                            
                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 1 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundMedio 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundMedio1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundMedio2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)

                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 2 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundDificil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundDificil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundDificil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)


                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 3 *quantidade de palavras certas*
                            -}


                            --let telaPalavras1 = gerarTelaRound roundMedio 10000
                            --let telaPalavras2 = gerarTelaRound roundDificil 10000
                            conteudo <- readFile "Ranking/numeros.txt"
                            let listaDeNumeros = splitIt conteudo
                            let numero = converteInteiro listaDeNumeros
                            let valorNovo = 7  --  pontuação alcançada caso tenhamos um record
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : numero

                            conteudo <- readFile "Ranking/nomes.txt"
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
                            
                            writeFile "Ranking/nomes.txt" nomeEspacoTres
                            appendFile "Ranking/nomes.txt" nomeEspacoDois
                            appendFile "Ranking/nomes.txt" nomeUm
                            writeFile "Ranking/nomes.txt" valorTresEspaco
                            appendFile "Ranking/nomes.txt" valorDoisEspaco
                            appendFile "Ranking/nomes.txt" (show valorUm)
                            --
                            writeFile "Ranking/rankingNumeros.txt" "Ranking: \n"
                            appendFile "Ranking/rankingNumeros.txt" ("1. " ++ nomeTres)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorTres) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n2. " ++ nomeDois)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorDois) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n3. " ++ nomeUm)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorUm) ++ " Pontos")
                            --putStr (telaPalavras)
                            
                            teste <- getLine
                            print teste

                    else if ipt == "2"
                        then do
                            cleanScreen
                            
                            conteudo <- readFile "Linguagens/linguagemHaskell.txt"
                            let listaHaskell = splitIt conteudo
                            let faseHaskell = createStage listaHaskell
                            print faseHaskell
                            callCommand "clear"
                            --rounds faceis
                            let roundFacil = faseHaskell !! 0
                            let roundFacil1 = faseHaskell !! 1
                            let roundFacil2 = faseHaskell !! 2
                            --rounds normais
                            let roundMedio = faseHaskell !! 3
                            let roundMedio1 = faseHaskell !! 4
                            let roundMedio2 = faseHaskell !! 5
                            --rounds dificeis
                            let roundDificil = faseHaskell !! 6
                            let roundDificil1 = faseHaskell !! 7
                            let roundDificil2 = faseHaskell !! 8
                            let roundDificil3 = faseHaskell !! 9
                            --Comandos abaixo cria o roud extra, caso o user seja sorteado com palavra BONUS 
                            {-
                            let faseExtra = hardRoundGen listaHaskell faseHaskell
                            let roundDificilExtra = faseExtra !! 8
                            let roundDificilExtra = faseExtra !! 9
                            let roundDificilExtra = faseExtra !! 10
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis

                            let telaPalavras = gerarTelaRound roundFacil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundFacil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundFacil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)
                            
                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 1 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundMedio 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundMedio1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundMedio2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)

                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 2 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundDificil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundDificil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundDificil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)


                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 3 *quantidade de palavras certas*
                            -}


                            --let telaPalavras1 = gerarTelaRound roundMedio 10000
                            --let telaPalavras2 = gerarTelaRound roundDificil 10000
                            conteudo <- readFile "Ranking/numeros.txt"
                            let listaDeNumeros = splitIt conteudo
                            let numero = converteInteiro listaDeNumeros
                            let valorNovo = 7  --  pontuação alcançada caso tenhamos um record
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : numero

                            conteudo <- readFile "Ranking/nomes.txt"
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
                            
                            writeFile "Ranking/nomes.txt" nomeEspacoTres
                            appendFile "Ranking/nomes.txt" nomeEspacoDois
                            appendFile "Ranking/nomes.txt" nomeUm
                            writeFile "Ranking/nomes.txt" valorTresEspaco
                            appendFile "Ranking/nomes.txt" valorDoisEspaco
                            appendFile "Ranking/nomes.txt" (show valorUm)
                            --
                            writeFile "Ranking/rankingNumeros.txt" "Ranking: \n"
                            appendFile "Ranking/rankingNumeros.txt" ("1. " ++ nomeTres)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorTres) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n2. " ++ nomeDois)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorDois) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n3. " ++ nomeUm)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorUm) ++ " Pontos")
                            --putStr (telaPalavras)
                            
                            teste <- getLine
                            print teste

                    
                    else if ipt == "3"
                        then do
                            cleanScreen
                            
                            conteudo <- readFile "Linguagens/linguagemJava.txt"
                            let listaJava = splitIt conteudo
                            let faseJava = createStage listaJava
                            print faseJava
                            callCommand "clear"
                            --rounds faceis
                            let roundFacil = faseJava !! 0
                            let roundFacil1 = faseJava !! 1
                            let roundFacil2 = faseJava !! 2
                            --rounds normais
                            let roundMedio = faseJava !! 3
                            let roundMedio1 = faseJava !! 4
                            let roundMedio2 = faseJava !! 5
                            --rounds dificeis
                            let roundDificil = faseJava !! 6
                            let roundDificil1 = faseJava !! 7
                            let roundDificil2 = faseJava !! 8
                            let roundDificil3 = faseJava !! 9
                            --Comandos abaixo cria o roud extra, caso o user seja sorteado com palavra BONUS 
                            {-
                            let faseExtra = hardRoundGen listaJava faseJava
                            let roundDificilExtra = faseExtra !! 8
                            let roundDificilExtra = faseExtra !! 9
                            let roundDificilExtra = faseExtra !! 10
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis

                            let telaPalavras = gerarTelaRound roundFacil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundFacil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundFacil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)
                            
                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 1 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundMedio 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundMedio1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundMedio2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)

                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 2 *quantidade de palavras certas*
                            -}

                            {-
                            --Exemplo de como funcionariam os rounds
                            --Primeiro rounds faceis
                            
                            let telaPalavras = gerarTelaRound roundDificil 10000
                            inicio <- getCurrentTime
                            pal <- getLine
                            fim <- getCurrentTime
                            let difTempo = (realToFrac (toRational(diffUTCTime fim inicio)))
                            let pontosFloat = (fromRational difTempo :: Float)
                            
                            let telaPalavras1 = gerarTelaRound roundDificil1 10000
                            inicio1 <- getCurrentTime
                            pal1 <- getLine
                            fim1 <- getCurrentTime
                            let difTempo1 = (realToFrac (toRational(diffUTCTime fim1 inicio1)))
                            let pontosFloat1 = (fromRational difTempo :: Float)

                            let telaPalavras2 = gerarTelaRound roundDificil2 10000
                            inicio2 <- getCurrentTime
                            pal2 <- getLine
                            fim2 <- getCurrentTime
                            let difTempo2 = (realToFrac (toRational(diffUTCTime fim2 inicio2)))
                            let pontosFloat2 = (fromRational difTempo :: Float)


                            let tempoTotal = pontosFloat + pontosFloat1 + pontosFloat2  
                            let PontuacaoTotal = calculaPontos tempoTotal 3 *quantidade de palavras certas*
                            -}


                            --let telaPalavras1 = gerarTelaRound roundMedio 10000
                            --let telaPalavras2 = gerarTelaRound roundDificil 10000
                            conteudo <- readFile "Ranking/numeros.txt"
                            let listaDeNumeros = splitIt conteudo
                            let numero = converteInteiro listaDeNumeros
                            let valorNovo = 7  --  pontuação alcançada caso tenhamos um record
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : numero

                            conteudo <- readFile "Ranking/nomes.txt"
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
                            
                            writeFile "Ranking/nomes.txt" nomeEspacoTres
                            appendFile "Ranking/nomes.txt" nomeEspacoDois
                            appendFile "Ranking/nomes.txt" nomeUm
                            writeFile "Ranking/nomes.txt" valorTresEspaco
                            appendFile "Ranking/nomes.txt" valorDoisEspaco
                            appendFile "Ranking/nomes.txt" (show valorUm)
                            --
                            writeFile "Ranking/rankingNumeros.txt" "Ranking: \n"
                            appendFile "Ranking/rankingNumeros.txt" ("1. " ++ nomeTres)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorTres) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n2. " ++ nomeDois)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorDois) ++ " Pontos")
                            appendFile "Ranking/rankingNumeros.txt" ("\n3. " ++ nomeUm)
                            appendFile "Ranking/rankingNumeros.txt" (" ------------ " ++ (show valorUm) ++ " Pontos")
                            --putStr (telaPalavras)
                            
                            teste <- getLine
                            print teste

                    else putStrLn "testes3"

        '2' -> do -- Ranking
                cleanScreen
                mostraRanking
                sair <- getChar
                main

        _ -> do -- Fechar o jogo
            system "clear"
            return ()
                
            
                   
{-  Teste Números Aleatórios

    --Numeros que definem o range
    let lis = ["0","1","2","3","4","5","6","7","8","9"]
    print ((createStage lis))

    k <- getLine
    n <- getLine

    let ki = (read k:: Integer)
    let ni = (read n:: Integer)

    print "testando funcao que gera numeros aleatorios em um range especifico"
    o <- randNumberR (ki,ni)
    print o

    --Test setOfIntegerRN && setOfFloatRN
    let lis = ["0","1","2","3","4","5","6","7","8","9","10","11","12"]
    let len = toInteger(length lis)
    g <- randNumberR (0,len)
    print "index"
    print g

    print "elemento"
    print (lis !! (fromIntegral g))

    print "testando funcao que gera n numeros aleatorios (float)"
    testFloat <- setOfFloatRN 10
    print (testFloat)

    print "testando funcao que gera n numeros aleatorios (int)"
    testInt <- setOfIntegerRN 10
    print (testInt)
-}
