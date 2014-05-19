

module TextToys.Breaks
    ( breakLines
    , breakHardLines
    , breakWords
    , breakSentences
    , Word(..)
    , Line(..)
    ) where


import           Control.Arrow  ((&&&))
import           Data.Monoid
import qualified Data.Text      as T
import           Data.Text.ICU

import           TextToys.Utils


breakLines :: LocaleName -> T.Text -> [(T.Text, Line)]
breakLines locale = breakStatus (breakLine locale)

breakHardLines :: LocaleName -> T.Text -> [T.Text]
breakHardLines locale = map (mconcat . map fst) . go
                      . breakStatus (breakLine locale)
  where go [] = []
        go xs = let (ys, zs) = takeTo ((== Hard) . snd) xs
                in  ys : go zs

breakWords :: LocaleName -> T.Text -> [(T.Text, Word)]
breakWords locale = breakStatus (breakWord locale)

breakSentences :: LocaleName -> T.Text -> [T.Text]
breakSentences locale = map brkBreak . breaks (breakSentence locale)

breakStatus :: Breaker a -> T.Text -> [(T.Text, a)]
breakStatus b t = map (brkBreak &&& brkStatus) $ breaks b t

