import Cores
import Pontuacao
import RandomFuncs
import Telas
import FileFuncs
import System.Process
import System.IO

cleanScreen = do
    system "cls"
    system "clear"


main = do
    hSetBuffering stdout NoBuffering
    cleanScreen
    {- Teste de Cores
    putStrLn "Teste de Cores"
    putStrLn (colorir "Teste" fundoAzul)
    putStrLn (colorir "Outra linha" verde)
    print (colorir "nao funciona se usar print" vermelho)
    -}

    putStrLn "Teste menu + tela round"
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
                    --
                    conteudo <- readFile "linguagemPython.txt"
                    let listaPython = splitIt conteudo
                    let fasePython = createStage listaPython

                    print fasePython
                    callCommand "clear"

                    let roundFacil = (fasePython !! 0 ++ fasePython !! 1++fasePython !! 2)
                    let roundMedio = (fasePython !! 3 ++ fasePython !! 4 ++ fasePython !! 5)
                    let roundDificil = (fasePython !! 6 ++ fasePython !! 7 ++ fasePython !! 8 ++ fasePython !! 9)
                    --let roundDificilExtra = (fasePython !! 8 ++ fasePython !! 9 ++ fasePython !! 10)
                    let telaPalavras = gerarTelaRound roundFacil 10000
                    --let telaPalavras1 = gerarTelaRound roundMedio 10000
                    --let telaPalavras2 = gerarTelaRound roundDificil 10000

                    conteudo <- readFile "numeros.txt"

                    let l = splitIt conteudo
                    let inteiro = converteInteiro l
                    let valorNovo = 7  --  pontuação alcançada
                    let novoNome = "DEU" --  nome da pessoa com a nova pontuação

                    let novaListaInteiros = valorNovo : inteiro

                    conteudo <- readFile "nomes.txt"

                    let listaNomes = splitIt conteudo
                    let novaListaNomes = novoNome : listaNomes 

                    print listaNomes
                    callCommand "clear"

                    let hankingDesordenado = zip novaListaInteiros novaListaNomes

                    let hankingOrdenado = ordena hankingDesordenado
                    let hankingAtualizado = excluiMenor hankingOrdenado

                    let tuplaUm = hankingAtualizado !!0
                    let tuplaDois = hankingAtualizado !!1
                    let tuplaTres = hankingAtualizado !!2

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

                    putStr (telaPalavras)

                    teste <- getLine
                    print teste

            else if ipt == "2"
                then do
                    cleanScreen
                    --
                    conteudo <- readFile "linguagemHaskell.txt"
                    let listaHaskell = splitIt conteudo
                    let faseHaskell = createStage listaHaskell
                    print faseHaskell
                    callCommand "clear"
                    let roundFacil = (faseHaskell !! 0 ++ faseHaskell !! 1++faseHaskell !! 2)
                    let roundMedio = (faseHaskell !! 3 ++ faseHaskell !! 4 ++ faseHaskell !! 5)
                    let roundDificil = (faseHaskell !! 6 ++ faseHaskell !! 7 ++ faseHaskell !! 8 ++ faseHaskell !! 9)
                    --let roundDificilExtra = (fasePython !! 8 ++ fasePython !! 9 ++ fasePython !! 10)
                    let telaPalavras = gerarTelaRound roundFacil 10000

                    putStr (telaPalavras)

                    conteudo <- readFile "numeros.txt"

                    let l = splitIt conteudo
                    let inteiro = converteInteiro l
                    let valorNovo = 20    --  pontuação alcançada
                    let novoNome = "BYU"  --  nome da pessoa com a nova pontuação

                    let novaListaInteiros = valorNovo : inteiro

                    conteudo <- readFile "nomes.txt"

                    let listaNomes = splitIt conteudo
                    let novaListaNomes = novoNome : listaNomes 

                    print listaNomes
                    callCommand "clear"

                    let hankingDesordenado = zip novaListaInteiros novaListaNomes

                    let hankingOrdenado = ordena hankingDesordenado
                    let hankingAtualizado = excluiMenor hankingOrdenado

                    let tuplaUm = hankingAtualizado !!0
                    let tuplaDois = hankingAtualizado !!1
                    let tuplaTres = hankingAtualizado !!2

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

                    teste <- getLine
                    print teste

            else putStrLn "testes3"

    else if input == "2"
        then do
            mostraHanking       
                
            
    else do print "teste"

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
