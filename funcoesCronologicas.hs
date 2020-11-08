import Text.Printf
import Data.Time

main = do
    --Inicio da contagem de tempo
    inicio <- getCurrentTime
    {-
    escopo de código que deve ser contado deve ser colocado aqui
    -}
    c <- getLine
    --Final da contagem de tempo
    final <- getCurrentTime
    --diferença de tempo representada por um número racional
    let difTempo = (realToFrac (toRational(diffUTCTime final inicio)))
    print difTempo

