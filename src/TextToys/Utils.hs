module TextToys.Utils
  ( takeTo
  ) where


import           Control.Arrow (first)


takeTo :: (a -> Bool) -> [a] -> ([a], [a])
takeTo _ []                 = ([], [])
takeTo p (x:xs) | p x       = ([x], xs)
                | otherwise = first (x:) $ takeTo p xs
