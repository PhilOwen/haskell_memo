import Turtle

main :: IO ()
main = do
  proc "say"    ["hello, how are you?"] empty
  proc "wget"   ["http://www.nch.com.au/acm/8kmp38.wav"] empty
  proc "afplay" ["8kmp38.wav"] empty
  return ()
