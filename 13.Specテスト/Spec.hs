import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "fibonacci numbers" $ do
    it "fib 1" $ do
      fib 1 `shouldBe` 1

    it "fib 2" $ do
      fib 2 `shouldBe` 1

    it "fib 8" $ do
      8 `shouldSatisfy` (\n -> fib n == fib (n-1) + fib (n-2))

    it "fib 12" $ do
      fib 12 `shouldSatisfy` (100 <)
