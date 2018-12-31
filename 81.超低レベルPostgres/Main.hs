import Control.Monad
import qualified Database.PostgreSQL.LibPQ as P
import qualified Data.ByteString.Char8 as B

main :: IO ()
main = do
  putStr "start connection... "
  conn <- P.connectdb "host=localhost port=5432 user=postgres password=postgres dbname=test\
db"
  P.errorMessage conn >>= \e -> case e of
    (Just "") -> putStrLn "ok"
    (Just e)  -> B.putStrLn e
    Nothing   -> error "fatal error!"
  putStrLn "start inserting"
  forM_ [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] $ \i -> do
    let stmt = B.concat ["INSERT INTO sensor_data (data_array) VALUES('", B.pack $ show i, \
"');"]
    P.exec conn stmt
  putStrLn "closing"
  P.finish conn
