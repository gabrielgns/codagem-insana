module Telas
-- Telas
(   menuPrincipal
,   menuSelecaoFase
-- Funções
,   gerarTelaRound
,   substituir
-- Constantes
,   nLinhas
,   nColunas
)
where
import Cores
import RandomFuncs


-- Tamanho do jogo 70 colunas x 20 linhas
nColunas :: Int
nColunas = 70

nLinhas :: Int
nLinhas = 20


{- Telas -}
menuPrincipal :: String
menuPrincipal =
    take 7 (cycle "\n") ++
    colorir (centralizar "  CODAGEM INSANA  ") fundoAzul ++ "\n" ++
    centralizar "[1] - Iniciar Jogo" ++ "\n" ++
    centralizar "[2] - Ranking     " ++ "\n" ++
    centralizar "[q] - Sair do Jogo" ++ "\n" ++
    take 9 (cycle "\n")

menuSelecaoFase :: String
menuSelecaoFase =
    take 7 (cycle "\n") ++
    colorir (centralizar "  CODAGEM INSANA  ") fundoAzul ++
    "\n" ++
    centralizar "[1] - Python                  " ++ "\n" ++
    centralizar "[2] - Haskell                 " ++ "\n" ++
    centralizar "[3] - Java                    " ++ "\n" ++
    centralizar "[q] - Voltar ao Menu Principal" ++ "\n" ++
    take 9 (cycle "\n")

menuRanking :: String
menuRanking =
    take 7 (cycle "\n") ++
    colorir (centralizar "  CODAGEM INSANA  ") fundoAzul ++
    "\n" ++
    centralizar "[1] - Python                  " ++ "\n" ++
    centralizar "[2] - Haskell                 " ++ "\n" ++
    centralizar "[3] - Java                    " ++ "\n" ++
    centralizar "[q] - Voltar ao Menu Principal" ++ "\n" ++
    take 9 (cycle "\n")


telaFracasso :: String
telaFracasso =
    take 7 (cycle "\n") ++
    centralizar "Você ainda não é INSANO o suficiente" ++ "\n" ++
    take 9 (cycle "\n")


telaEntrarRanking :: String
telaEntrarRanking =
    take 7 (cycle "\n") ++
    centralizar "Parabéns seu nome será lembrado por todos" ++ "\n" ++
    take 9 (cycle "\n")

telaFinal :: String
telaFinal =
    take 7 (cycle "\n") ++
    centralizar "[1] - Jogar novamente         " ++ "\n" ++
    centralizar "[2] - Voltar ao menu principal" ++ "\n" ++
    centralizar "[q] - Sair do jogo            " ++ "\n" ++
    take 9 (cycle "\n")


{- Funções -}
criarEspacos :: Int -> String
criarEspacos quantidade = take quantidade (cycle " ")


centralizar :: String -> String
centralizar texto
    | textoTemTamanhoPar = criarEspacos nEspacos ++ texto ++ criarEspacos nEspacos
    | otherwise = criarEspacos (nEspacos + 1) ++ texto ++ criarEspacos nEspacos
    where
        textoTemTamanhoPar = even (length texto)
        metadeTamanhoTexto = round(fromIntegral (length texto)/2)
        nEspacos = round(fromIntegral nColunas/2) - metadeTamanhoTexto


criarLinhaPalavra :: Int -> String -> String
criarLinhaPalavra nEspacos texto = take nEspacos (cycle " ") ++ texto ++ "\n"


completarTelaRound :: String -> String
completarTelaRound texto = texto ++ take (nLinhas - qLinhas - 2) (cycle "\n")
    where
        qLinhas = contarLinhas 0 texto


contarLinhas :: Int -> String -> Int
contarLinhas contador texto
    | null texto = contador
    | head texto == '\n' = contarLinhas (contador + 1) (tail texto)
    | otherwise = contarLinhas contador (tail texto)


gerarTelaRound :: [String] -> Int -> String
gerarTelaRound palavras pontuacao =
    completarTelaRound (gerarAreaPalavras palavras) ++
    gerarBarraStatus pontuacao


gerarAreaPalavras :: [String] -> String
gerarAreaPalavras palavras
    | null palavras = ""
    | otherwise =
        criarLinhaPalavra nEspacos palavra ++
        take (randomInt 0 4) (cycle "\n") ++
        gerarAreaPalavras (tail palavras)
    where
        palavra = head palavras
        maxEspacos = nColunas - length palavra
        nEspacos = randomInt 0 maxEspacos


gerarBarraStatus :: Int -> String
gerarBarraStatus pontos =
    colorir ("Pontuação: " ++ show pontos) fundoAzul  ++ "\n"


substituir :: String -> String -> String -> [String]
substituir plvr nvPlvr txt = do
    let inicioPalavra = buscarPalavra plvr txt 0
        txtAntesPalavra = take inicioPalavra txt
        txtAposPalavra = drop (inicioPalavra + length plvr) txt
        nvTxt = txtAntesPalavra ++ nvPlvr ++ txtAposPalavra
    return nvTxt


-- Funções Auxiliares para a função substituir
buscarPalavra :: String -> String -> Int -> Int
buscarPalavra plvr txt posicao
  |  length txt < length plvr = -1
  |  ehPalavraProcurada plvr palavraEncontrada = posicao + inicioIndice
  |  otherwise = buscarPalavra plvr (drop (inicioIndice+1) txt) (inicioIndice+1)
  where
    inicioIndice = buscarInicioPalavra plvr txt 0
    palavraEncontrada = take (length plvr) (drop inicioIndice txt)


buscarInicioPalavra :: String -> String -> Int -> Int
buscarInicioPalavra plvr txt posicao
  | head txt == inicioPalavra = posicao
  | null txt = -1
  | otherwise = buscarInicioPalavra plvr (tail txt) (posicao+1)
    where inicioPalavra = head plvr


ehPalavraProcurada :: String -> String -> Bool
ehPalavraProcurada plvr txt = plvr == busca
    where
        busca = take (length plvr) txt
