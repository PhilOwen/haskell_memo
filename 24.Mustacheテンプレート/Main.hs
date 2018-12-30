import Data.Aeson
import Data.Text
import Data.Map
import Text.Mustache
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T

printUsingExternalFile :: IO T.Text
printUsingExternalFile = do
  template <- compileMustacheFile "main.mustache"
  let obj = object [
          "number" .= (42:: Integer),
          "array"  .= [(1:: Integer)..5],
          "object" .= [toObject "foo" "2016", toObject "bar" "2013"]
        ]
  return $ renderMustache template obj

toObject :: Text -> Text -> Map Text Text
toObject k v = fromList [("name", k), ("content", v)]


printUsingText :: IO T.Text
printUsingText = do
  let Right template = compileMustacheText "hello" "Hello, {{name}}!"
  let obj = object [
          "name" .= ("Jean":: Text)
        ]
  return $ renderMustache template obj

main :: IO ()
main = do
  printUsingExternalFile >>= T.putStr
  printUsingText >>= T.putStr
