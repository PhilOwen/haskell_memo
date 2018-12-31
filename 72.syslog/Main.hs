import Control.Monad
import Control.Applicative
import qualified Foreign.C.String as C
import qualified System.Posix.Syslog as L

main :: IO ()
main = do
  putStrLn "start reading lines..."
  ls <- take 3 . lines <$> getContents
  forM_ ls $ \line -> do
    writeLog line

writeLog :: String -> IO ()
writeLog cs = C.withCStringLen cs $ \cs' ->
  L.syslog Nothing L.Info cs'