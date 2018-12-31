import Control.Monad
import qualified Database.HDBC as DB
import qualified Database.HDBC.Sqlite3 as DB

main :: IO ()
main = do
  conn <- DB.connectSqlite3 "sensor_data.sqlite"
  createSensorDataTable conn
  forM_ rows $ \cs -> do
    insertSensorData conn cs
  DB.commit conn
  DB.disconnect conn

rows :: [String]
rows = ["cookie", "butter", "choco", "cookie"]

createSensorDataTable :: DB.Connection -> IO Integer
createSensorDataTable conn =
  DB.run conn "CREATE TABLE sensor_data (id INTEGER PRIMARY KEY, description TEXT)" []

insertSensorData :: DB.Connection -> String -> IO Integer
insertSensorData conn cs =
  DB.run conn "INSERT INTO sensor_data(description) VALUES (?)" params where
    params = [DB.toSql cs]
