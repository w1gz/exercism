module DNA
        ( toRNA
        )
where

data CommonNucleotide = Adenine | Cytosine | Guanine
data DNA = DNA CommonNucleotide | Thymine
data RNA = RNA CommonNucleotide | Uracil

rnaToChar :: RNA -> Char
rnaToChar rna = case rna of
        RNA Adenine  -> 'A'
        RNA Cytosine -> 'C'
        RNA Guanine  -> 'G'
        Uracil       -> 'U'

dnaToRNA :: DNA -> RNA
dnaToRNA dna = case dna of
        DNA Guanine  -> RNA Cytosine
        DNA Cytosine -> RNA Guanine
        Thymine      -> RNA Adenine
        DNA Adenine  -> Uracil

charToDNA :: Char -> Maybe DNA
charToDNA c | c == 'A'  = Just $ DNA Adenine
            | c == 'C'  = Just $ DNA Cytosine
            | c == 'G'  = Just $ DNA Guanine
            | c == 'T'  = Just Thymine
            | otherwise = Nothing

strandComplement :: Char -> Either Char Char
strandComplement c = case charToDNA c of
        Just dna -> Right $ rnaToChar . dnaToRNA $ dna
        Nothing  -> Left c

toRNA :: String -> Either Char String
toRNA = traverse strandComplement
