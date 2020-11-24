module Cores
( colorir
, preto
, vermelho
, verde
, amarelo
, azul
, magenta
, ciano
, branco
, fundoPreto
, fundoVermelho
, fundoVerde
, fundoAmarelo
, fundoAzul
, fundoMagenta
, fundoCiano
, fundoBranco
)
where

-- | Primeiro arg é o texto, o segundo é a cor
colorir :: String -> String  -> String
colorir texto cor = cor ++ texto ++ reset


-- Cores das Letras
preto = "\x1b[30m"
azul = "\x1b[34m"
verde = "\x1b[32m"
vermelho = "\x1b[31m"
amarelo = "\x1b[33m"
magenta = "\x1b[35m"
ciano = "\x1b[36m"
branco = "\x1b[37m"
reset = "\x1b[0m"


-- Cores de Fundo 
fundoPreto = "\x1b[40m"
fundoVermelho = "\x1b[41m"
fundoVerde = "\x1b[42m"
fundoAmarelo = "\x1b[43m"
fundoAzul = "\x1b[44m"
fundoMagenta = "\x1b[45m"
fundoCiano = "\x1b[46m"
fundoBranco = "\x1b[47m"
