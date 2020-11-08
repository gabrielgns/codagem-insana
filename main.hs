import Cores
import Pontuacao
import FuncoesRandomicas
import Telas
import FuncoesArquivo
import System.Process
import System.IO

limpaTela = do
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
    limpaTela
    putStr menuPrincipal
    comando <- getChar

    case comando of
        '1' -> do -- Selecionar Fase

            limpaTela
            putStr menuSelecaoFase
            ipt <- getLine

            if ipt == "q"
                then main
                else do 
                    hSetBuffering stdin LineBuffering

                    if ipt == "1"
                        then do
                            limpaTela
                            
                            conteudo <- readFile "Linguagens/linguagemPython.txt"
                            let listaPython = separa conteudo
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
                            conteudo <- readFile "Ranking/numeros.txt"
                            let l = separa conteudo
                            let inteiro = converteInteiro l
                            let valorNovo = 7  --  pontuação alcançada
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : inteiro
                            conteudo <- readFile "Ranking/nomes.txt"
                            let listaNomes = separa conteudo
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
                            putStr (telaPalavras)
                            teste <- getLine
                            print teste

                    else if ipt == "2"
                        then do
                            limpaTela
                            --
                            conteudo <- readFile "Linguagens/linguagemHaskell.txt"
                            let listaPython = separa conteudo
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
                            conteudo <- readFile "Ranking/numeros.txt"
                            let l = separa conteudo
                            let inteiro = converteInteiro l
                            let valorNovo = 7  --  pontuação alcançada
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : inteiro
                            conteudo <- readFile "Ranking/nomes.txt"
                            let listaNomes = separa conteudo
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
                            putStr (telaPalavras)
                            teste <- getLine
                            print teste
                    
                    else if ipt == "3"
                        then do
                            limpaTela
                            --
                            conteudo <- readFile "Linguagens/linguagemJava.txt"
                            let listaPython = separa conteudo
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
                            conteudo <- readFile "Ranking/numeros.txt"
                            let l = separa conteudo
                            let inteiro = converteInteiro l
                            let valorNovo = 7  --  pontuação alcançada
                            let novoNome = "DEU" --  nome da pessoa com a nova pontuação
                            let novaListaInteiros = valorNovo : inteiro
                            conteudo <- readFile "Ranking/nomes.txt"
                            let listaNomes = separa conteudo
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
                            putStr (telaPalavras)
                            teste <- getLine
                            print teste
                    else putStrLn "testes3"

        '2' -> do -- Ranking
                limpaTela
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