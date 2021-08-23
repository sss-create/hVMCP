{-# LANGUAGE OverloadedStrings #-}
module Data.VMCP.MarionetteSpec where

import Test.Hspec
import Data.VMCP.Marionette
import qualified Sound.OSC as OSC
import Control.Monad.State (execStateT)

spec = do
  describe "fromOSCMessage" $ do
    context "when provided with unknown Message" $ do
        it "returns Nothing" $
          fromOSCMessage (OSC.Message "invalidAddress" []) == Nothing

  describe "pop" $ do
    context "when State is empty list" $ do
      it "returns empty list" $
        execStateT pop ([] :: [Int]) `shouldBe` []