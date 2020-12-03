:- module(linguagens, [linguagem/2]).


linguagem(python, Palavras) :- Palavras = [
    "and", "as", "assert", "async", "await", "break", "class",
    "def", "if", "elif", "else", "except", "finally", "from",
    "in", "is", "lambda", "None", "for", "not", "or", "raise",
    "return", "with", "yield"
].

linguagem(java, Palavras):- Palavras = [].

linguagem(haskell, Palavras):- Palavras = [].

linguagem(prolog, Palavras):- Palavras = [].
