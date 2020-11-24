module Pontuacao
(calculaPontos)
where

calculaPontos :: Float -> Int -> Int -> Float
calculaPontos tempo peso qtdPalavras = 
    ((fromIntegral peso :: Float) * 
    (fromIntegral qtdPalavras :: Float))
    * calcularFatorPontuacao tempo

calcularFatorPontuacao :: Float -> Float
calcularFatorPontuacao tempo
    | tempo <= 2.0 = 400.0
    | tempo <= 4.0 = 250.0
    | tempo <= 5.0 = 100.0
    | otherwise = 0.0

{-teste da função
main = do
	let tempo = 0.5
	let tempo2 = 0.6
	let tempo3 = 0.7

	let peso = 1
	let peso2 = 2
	let peso3 = 3

	let quant = 5

	print "jogador 1"
	
	print (pena tempo peso quant)
	print (pena tempo2 peso quant)
	print (pena tempo3 peso quant)

	print "jogador 2"

	print (pena tempo peso2 quant)
	print (pena tempo2 peso2 quant)
	print (pena tempo3 peso2 quant)
	
	print "jogador 3"

	print (pena tempo peso3 quant)
	print (pena tempo2 peso3 quant)
	print (pena tempo3 peso3 quant)
-}