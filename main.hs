import Cores
import RandNumberFuncs

main = do
	putStrLn (colorir "Teste" fundoAzul)
	putStrLn (colorir "Outra linha" verde)
	print (colorir "nao funciona se usar print" vermelho)

	--Numeros que definem o range
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
