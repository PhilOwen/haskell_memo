import Control.Monad
import Control.Concurrent
import Foreign.C.Types

foreign import ccall "wiringPiSetup" c_wiringPiSetup :: IO ()
foreign import ccall "pinMode"       c_pinMode       :: CInt -> CInt -> IO ()
foreign import ccall "digitalWrite"  c_digitalWrite  :: CInt -> CInt -> IO ()

oUTPUT :: CInt
oUTPUT = 1
hIGH, lOW :: CInt
hIGH = 1
lOW  = 0

main :: IO ()
main = do
  putStrLn "start!"
  let pin = 29
  c_wiringPiSetup
  c_pinMode pin 1
  forever $ do
    c_digitalWrite pin hIGH
    threadDelay $ 100*1000
    c_digitalWrite pin lOW
    threadDelay $ 1300*1000
