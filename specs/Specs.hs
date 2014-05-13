{-# LANGUAGE OverloadedStrings #-}


module Main where


import qualified Data.Text     as T
import           Data.Text.ICU
import           Test.Hspec

import           TextToys


enUS :: LocaleName
enUS = Locale "en_US"

main :: IO ()
main = hspec $
    describe "TextToys.Breaks" $ do
        describe "breakLines" $ do
            it "should break text into lines." $ do
                let input = "This is a line.\nAnd another one.\nA third.\n"
                breakLines enUS input `shouldBe` [ ("This ", Soft)
                                                 , ("is ", Soft)
                                                 , ("a ", Soft)
                                                 , ("line.\n", Hard)
                                                 , ("And ", Soft)
                                                 , ("another ", Soft)
                                                 , ("one.\n", Hard)
                                                 , ("A ", Soft)
                                                 , ("third.\n", Hard)
                                                 ]

            it "should break text into sentences." $ do
                pending

            it "should break text into words." $ do
                pending

