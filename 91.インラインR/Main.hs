import Foreign.R.Type as R
import Foreign.R as R(cast)
import Language.R.Instance(runRegion)
import Language.R.QQ
import Language.R.HExp as HExp
import Data.Vector.SEXP as R(head, toList)

fourtyTwo :: IO Double
fourtyTwo = runRegion $ do
  ans <- [r| 42 |]
  let HExp.Real xHexp = hexp $ (R.cast R.SReal) ans
  return $ R.head xHexp

numSeq :: IO [Double]
numSeq = runRegion $ do
  ans <- [r| c(1, 2, 3, 6, 11, 23, 47) |]
  let HExp.Real xHexp = hexp $ (R.cast R.SReal) ans
  return $ R.toList xHexp

main :: IO ()
main = do
  fourtyTwo >>= print
  numSeq >>= print