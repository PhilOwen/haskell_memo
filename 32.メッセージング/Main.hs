{-# LANGUAGE OverloadedStrings #-}
import Network.AMQP
import Control.Monad
import Control.Concurrent
import Data.Text
import Data.Time
import qualified Data.ByteString.Lazy.Char8 as B

main = do
  conn <- openConnection "localhost" "/" "guest" "guest"
  chan <- openChannel conn
  declareQueue chan queueOpts
  declareExchange chan exchangeOpts
  bindQueue chan queueName' exchangeName' key

  consumeMsgs chan queueName' Ack receiveData

  forM_ [1..100] $ \_ -> do
    putStrLn "sending..."
    t <- getCurrentTime
    let msg = newMsg { msgBody = B.pack $ show t }
    publishMsg chan exchangeName' key msg
    threadDelay (800 * 1000)

  closeConnection conn

receiveData :: (Message, Envelope) -> IO ()
receiveData (msg, env) = do
  putStrLn $ "Received: " ++ (B.unpack $ msgBody msg)
  ackEnv env

queueOpts :: QueueOpts
queueOpts = newQueue { queueName = queueName' }
exchangeOpts :: ExchangeOpts
exchangeOpts = newExchange { exchangeName = exchangeName', exchangeType = "direct" }

queueName' :: Text
queueName' = "queue1"
exchangeName' :: Text
exchangeName' = "ex1"
key :: Text
key = "foo"
