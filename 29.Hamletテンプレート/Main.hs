import Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import Text.Hamlet (hamletFile)
import Text.Blaze.Html.Renderer.Text (renderHtml)

main :: IO ()
main = do
  let title = pack "hamlet test"
  let items = pack <$> ["foo", "bar", "baz"]
  let html = renderHtml $ $(hamletFile "index.hamlet") undefined
  T.putStr html