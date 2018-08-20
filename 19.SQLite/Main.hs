import Data.Word
import Data.Time
import System.Random
import Control.Concurrent
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Logger
import Control.Monad.Trans.Resource
import Database.Persist
import Database.Persist.Quasi
import Database.Persist.TH
import Database.Persist.Sqlite

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
  $(persistFileWith lowerCaseSettings "models")

main :: IO ()
main = runStderrLoggingT $ withSqlitePool "log.sqlite" 1 $
    \pool -> liftIO $ do
      doMigrate pool
      forever $ do
        time <- getCurrentTime
        record <- readRawData
        let sensorData = toSensorData time record
        runSqlPool (insert sensorData) pool
        threadDelay (800*1000)
        
toSensorData :: UTCTime -> [Word8] -> SensorData
toSensorData time ws = SensorData time i j k l
  where i:j:k:l:[] = map fromIntegral ws

doMigrate :: ConnectionPool -> IO ()
doMigrate pool = runResourceT $
    runSqlPool (runMigration migrateAll) pool

-- External
readRawData :: IO [Word8]
readRawData = forM [1..4] (const randomIO)
