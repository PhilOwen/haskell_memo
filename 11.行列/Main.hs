import Numeric.LinearAlgebra
import Prelude hiding((<>))

main :: IO ()
main = do
  putStrLn "## ベクトルの単純計算"
  let v1 = vector [1, 2::R]
      v2 = vector [4, 5::R]
  print $ v1 + v2
  print $ 3 * v1
  print $ v1 `dot` v2
  
  let v3 = vector [1, 0, 0::R]
      v4 = vector [0, 1, 0::R]
  print $ v3 `cross` v4

  putStrLn "## 行列の単純計算"
  let m1 = (2><2) [1::R ..]
      m2 = ident 2::Matrix R
  print m1
  print m2
  print $ m1 + m2
  print $ m1 <> m2

  putStrLn "## 逆行列"
  let m3 = (2><2) [-1::R ..]
      m3' = inv m3
  print m3'
  print $ m3 <> m3'

  putStrLn "## 行列式を解く"
  let m4 = (2><2) [-2::R ..]
      m5 = matrix 1 [3, 5]
      v5 = vector [3, 5::R]
  print $ linearSolve m4 m5
  print $ (inv m4) #> v5
