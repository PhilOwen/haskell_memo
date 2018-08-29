import Text.Regex.TDFA
import Control.Monad

main :: IO ()
main = do
  printMatchOrNot "/book/([1-9]|[1-9][0-9])" [
    "/book/42",
    "/book/0",
    "/book/123"]

  printMatchOrNot "/book/[1-9][0-9]?" [
    "/book/42",
    "/book/0",
    "/book/123"]

  printMatchOrNot "[1-9][0-9]?" [
    "/book/42",
    "/book/0",
    "/book/123"]

  printMatchOrNot "^[1-9][0-9]?" [
    "42",
    "00",
    "/book/42"]

  printMatchOrNot "(foo|bar|baz)" [
    "foo",
    "zoo"]

  putStrLn "## oの出現数"
  print (testString =~ "o":: Int)

  putStrLn "## oで始まる単語の個数"
  print (testString =~  "\\<o[A-z]*\\>":: Int)

  putStrLn "## oで始まる単語のうち、最初のもの"
  print (testString =~~ "\\<o[A-z]*\\>":: Maybe String)

printMatchOrNot :: String -> [String] -> IO ()
printMatchOrNot pattern css = do
  putStrLn $ "## パターン: " ++ pattern
  forM_ css $ \cs ->
    putStrLn $ cs ++ if cs =~ pattern then ": OK" else ": NG"

testString :: String
testString = "the quick brown fox jumps over the lazy dog"
