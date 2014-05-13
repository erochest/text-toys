

module TextToys.Types
    ( PunktAnnotation(..)
    ) where


data PunktAnnotation = Abbreviation
                     | Ellipses
                     | SentenceBoundary
                     deriving (Show, Eq)

