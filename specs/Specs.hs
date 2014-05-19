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
        describe "breakLines" $
            it "should break text into lines." $
                let input = "This is a line.\nAnd another one.\nA third.\n"
                in  breakLines enUS input `shouldBe` [ ("This ", Soft)
                                                     , ("is ", Soft)
                                                     , ("a ", Soft)
                                                     , ("line.\n", Hard)
                                                     , ("And ", Soft)
                                                     , ("another ", Soft)
                                                     , ("one.\n", Hard)
                                                     , ("A ", Soft)
                                                     , ("third.\n", Hard)
                                                     ]

        describe "breakHardLines" $
            it "should only return hard line breaks." $
                let input = "This is a line.\nAnd another one.\nA third.\n"
                in  breakHardLines enUS input `shouldBe` [ "This is a line.\n"
                                                         , "And another one.\n"
                                                         , "A third.\n"
                                                         ]

        describe "breakSentences" $ do
            it "should break text into sentences." $
                let input = "This is a line, and another one. Also a third.\n"
                in  breakSentences enUS input `shouldBe` [ "This is a line, and another one. "
                                                         , "Also a third.\n"
                                                         ]
            it "should not handle line breaks correctly." $
                let input = "This is a line,\nand another one.\nAlso a third.\n"
                in  breakSentences enUS input `shouldBe` [ "This is a line,\n"
                                                         , "and another one.\n"
                                                         , "Also a third.\n"
                                                         ]

        describe "breakWords" $
            it "should break text into words." $
                let input = "This is a line,\nand another one.\nAlso a third.\n"
                in  breakWords enUS input `shouldBe` [ ("This", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("is", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("a", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("line", Letter)
                                                     , (",", Uncategorized)
                                                     , ("\n", Uncategorized)
                                                     , ("and", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("another", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("one", Letter)
                                                     , (".", Uncategorized)
                                                     , ("\n", Uncategorized)
                                                     , ("Also", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("a", Letter)
                                                     , (" ", Uncategorized)
                                                     , ("third", Letter)
                                                     , (".", Uncategorized)
                                                     , ("\n", Uncategorized)
                                                     ]

