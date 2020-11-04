module Telas
-- Telas
(   menuPrincipal
,   menuSelecaoFase
,   barraStatus
-- Funções
,   completarLinha
,   criarLinhaPalavra
,   centralizar
,   criarTelaRound
,   contarLinhas
,   completarTelaRound
-- Constantes
,   nLinhas
,   nColunas
)
where
import Cores
import RandNumberFuncs
import System.Random
import System.IO.Unsafe
-- Tamanho do jogo 70 colunas x 20 linhas
nColunas :: Int
nColunas = 70

nLinhas :: Int
nLinhas = 20

{- Funções -}
centralizar :: String -> String
centralizar texto
    | even (length texto) = take nEspacos (cycle " ") ++ texto ++ take nEspacos  (cycle " ")
    | otherwise = take (nEspacos + 1) (cycle " ") ++ texto ++ take nEspacos (cycle " ")
    where
        nEspacos = round(fromIntegral nColunas/2) - round(fromIntegral (length texto)/2)

-- | Completa texto com espaços até fechar uma linha
completarLinha :: String -> String
completarLinha texto = texto ++ take (length texto - nColunas) (cycle " ")

criarLinhaPalavra :: Int -> String -> String
criarLinhaPalavra nEspacos texto = take nEspacos (cycle " ") ++ texto ++ "\n"

randomInt :: Int -> Int -> Int
randomInt x y = unsafePerformIO (getStdRandom (randomR (x, y)))

-- Fazer funcao que chamar criar tela round e depois completa tela round, retornando a tela completa
criarTelaRound :: [String] -> String
criarTelaRound palavras
    | palavras == [] = ""
    | otherwise =
        criarLinhaPalavra nEspacos palavra ++
        take (randomInt 0 6) (cycle "\n") ++
        criarTelaRound (tail palavras)
    where
        palavra = head palavras
        maxEspacos = nColunas - length palavra
        nEspacos = randomInt 0 maxEspacos -- Chamar funcao de gerar numero aleatório passando maxEspacos

completarTelaRound :: String -> String
completarTelaRound texto = texto ++ take (nLinhas - qLinhas - 2) (cycle "\n")
    where
        qLinhas = contarLinhas 0 texto

contarLinhas :: Int -> String -> Int
contarLinhas contador texto
    | texto == [] = contador
    | head texto == '\n' = contarLinhas (contador + 1) (tail texto)
    | otherwise = contarLinhas contador (tail texto)

criarEspacos :: Int -> String
criarEspacos quantidade = take quantidade (cycle " ")


{- Telas -}
menuPrincipal :: String
menuPrincipal =
    take 7 (cycle "\n") ++
    colorir (centralizar "  CODAGEM INSANA  ") fundoAzul ++
    "\n" ++
    centralizar "[1] - Iniciar Jogo" ++
    centralizar "[2] - Ranking     " ++
    centralizar "[q] - Sair do Jogo" ++
    take 9 (cycle "\n")

menuSelecaoFase :: String
menuSelecaoFase =
    take 7 (cycle "\n") ++
    colorir (centralizar "  CODAGEM INSANA  ") fundoAzul ++
    "\n" ++
    centralizar "[1] - Python                  " ++
    centralizar "[2] - Haskell                 " ++
    centralizar "[q] - Voltar ao Menu Principal" ++
    take 9 (cycle "\n")


barraStatus :: Int -> String
barraStatus pontos =
    (colorir ("Pontuação: " ++ show pontos ++ "\n") fundoAzul) ++ " > "
