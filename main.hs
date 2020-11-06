import Cores

import RandomFuncs
import Telas
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
                    let telaPalavras = gerarTelaRound ["palavra1", "palvra2", "asasdasdasdasd"] 10000

                    putStr (telaPalavras)

                    teste <- getLine
                    print teste

                else putStrLn "testes3"
        else do
            print "teste"

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
