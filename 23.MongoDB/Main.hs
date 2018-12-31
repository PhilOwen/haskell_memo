import Data.Time
import Control.Monad
import Control.Monad.Trans
import Database.MongoDB

main :: IO ()
main = do
  pipe <- connect $ host "localhost"
  let run' t l = access pipe master "lines" $ run t l
  ls <- take 3 <$> lines <$> getContents
  forM_ ls $ \l -> do
    t <- getCurrentTime
    run' t l
  close pipe

run :: UTCTime -> String -> Action IO Value
run t l = insert "log" ["time" =: t, "line" =: l]
