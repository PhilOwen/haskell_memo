import Data.Text as T
import Data.Text.Read
import Data.Text.IO as T
import Data.Either hiding (fromRight)
import Data.Either.Unwrap
import Data.Ini

main :: IO ()
main = do
  ini <- fromRight <$> readIniFile "app.ini"
  let readDecimal section key = fromRight $ readValue section key decimal ini
      readText section key    = fromRight $ lookupValue section key ini

  let host       = readText "server" "host"
      port           = readDecimal "server" "port"
      threadPoolSize = readDecimal "server" "thread.pool.size"
      errorLevel = readText "server" "errorlevel"
      username   = readText "user" "username"

  T.putStrLn $ "host is " `append` host
  T.putStrLn $ "port #" `append` show' port
  T.putStrLn $ "thread pool size is " `append` show' threadPoolSize
  T.putStrLn $ "error level is " `append` errorLevel
  T.putStrLn $ "user is " `append` username

show' :: Int -> Text
show' = pack . show 