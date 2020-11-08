import Control.Concurrent --Para usar o sleep
import Text.Printf 
import Data.Time --Para usar a contagem de tempo

main = do
    --Exemplo de execução de um sleep de 1 segundo
    threadDelay 1000000

    --Inicio da contagem de tempo
    inicio <- getCurrentTime
    
    {-
    Escopo de código que deve ser contado deve ser colocado aqui
    Ex : 
	a <- getLine
	b <- getLine
	print a ++ b ++ a
    -}
    
    palavra <- getLine
    --Final da contagem de tempo
    final <- getCurrentTime
    
    --Diferença de tempo representada por um número racional
    let difTempo = (realToFrac (toRational(diffUTCTime final inicio)))
    
    print difTempo

