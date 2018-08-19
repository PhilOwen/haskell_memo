{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
import Data.Aeson
import Data.Map(fromList)
import Data.Text(Text)
import GHC.Generics

data Pair = Pair { city:: String, year:: Integer }
  deriving (Show, Generic)
instance ToJSON Pair

main :: IO ()
main = do
  let i    = toJSON (42::Integer)
  let arr  = toJSON [(1::Integer) ..6]
  let obj1 = toJSON $ fromList [("Sochi":: Text, 2014:: Integer)]
  let obj2 = object ["Rio" .= (2016:: Integer)]
  let p    = toJSON $ Pair "London" 2012

  print i
  print arr
  print obj1
  print obj2
  print p
