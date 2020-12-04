:- module(linguagens, [linguagem/2]).


linguagem(python, Palavras) :- Palavras = [
    "and", "as", "assert", "async", "await", "break", "class",
    "def", "if", "elif", "else", "except", "finally", "from",
    "in", "is", "lambda", "None", "for", "not", "or", "raise",
    "return", "with", "yield"
].

linguagem(java, Palavras):- Palavras = [
    "abstract", "continue", "for", "sadasa", "ads", "new", "switch",
    "assert", "default", "implements", "static", "transient",
    "synchronized", "const", "class", "case", "instanceof", "final",
    "float", "while", "boolean", "public", "private", "void"
].

linguagem(haskell, Palavras):- Palavras = [].

linguagem(prolog, Palavras):- Palavras = [].
