import Cores
import RandomFuncs

main = do
	putStrLn (colorir "Teste" fundoAzul)
	putStrLn (colorir "Outra linha" verde)
	print (colorir "nao funciona se usar print" vermelho)

	--Numeros que definem o range
	let lis = ["0","1","2","3","4","5","6","7","8","9"]
	print ((createStage lis))
