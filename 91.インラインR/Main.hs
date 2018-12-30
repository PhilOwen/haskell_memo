import Language.R.QQ
import Language.R.Instance(runRegion)
import qualified Language.R.HExp  as HExp
import qualified Foreign.R        as R
import qualified Foreign.R.Type   as R
import qualified Data.Vector.SEXP as R

helloR :: IO ()
helloR =  runRegion $
  [r| print("hello R") |] >> return ()

fourtyTwo :: IO Double
fourtyTwo = runRegion $ extractDouble <$> [r|
    42
  |]

sqrt' :: [Double] -> IO [Double]
sqrt' xs = runRegion $ extractDoubleList <$> [r|
    sqrt(xs_hs)
  |]

extractDouble :: R.SomeSEXP s -> Double
extractDouble x = R.head xHexp where
  HExp.Real xHexp = HExp.hexp $ (R.cast R.SReal) x
extractDoubleList :: R.SomeSEXP s -> [Double]
extractDoubleList xs = R.toList xHexp where
  HExp.Real xHexp = HExp.hexp $ (R.cast R.SReal) xs

main :: IO ()
main = do
  helloR
  print =<< fourtyTwo
  print =<< sqrt' [1..20]
