

module TextToys.Breaks
    ( breakLines
    , breakWords
    , breakSentences
    , Word(..)
    , Line(..)
    ) where


import Control.Arrow ((&&&))
import qualified Data.Text           as T
import           Data.Text.ICU


breakLines :: LocaleName -> T.Text -> [(T.Text, Line)]
breakLines locale = breakStatus (breakLine locale)

breakWords :: LocaleName -> T.Text -> IO [(T.Text, Word)]
breakWords = undefined

breakSentences :: LocaleName -> T.Text -> IO [T.Text]
breakSentences = undefined

breakStatus :: Breaker a -> T.Text -> [(T.Text, a)]
breakStatus b t = map (brkBreak &&& brkStatus) $ breaks b t

