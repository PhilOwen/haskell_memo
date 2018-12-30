import Data.IORef
import Control.Monad
import Graphics.UI.GLUT

width, height :: GLint
width  = 600
height = 600

main :: IO ()
main = do
  getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  createWindow "Hello GLUT"
  windowSize $= Size width height
  clearColor $= Color4 0.2 0.2 0.2 0

  ref <- newIORef $ Position 0 0
  displayCallback $= display ref
  motionCallback $= Just (mouse ref)

  mainLoop
 
display :: IORef Position -> DisplayCallback
display ref = do 
  clear [ColorBuffer]
  fill 0.7 0.2 0.2
  renderPrimitive Triangles $ do
    vertex2 (-0.8)  (-0.5)
    vertex2 (-0.2)   (-0.5)
    vertex2 (-0.75) (-0.1)

  fill 0.4 0.5 0.9
  renderPrimitive Quads $ do
    vertex2 (-0.35) (-0.55)
    vertex2 (-0.35) (-0.7)
    vertex2 (-0.3)  (-0.7)
    vertex2 (-0.3)  (-0.55)

  fill 0.9 0.8 0.3
  pos <- get ref
  renderPrimitive Quads $ do
    forM_ (toRect $ pixelToGLCoord pos) $ \(x, y) -> do
      print (x, y)
      vertex2 x y
  
  swapBuffers

mouse :: IORef Position -> MotionCallback
mouse ref pos = do
  ref $= pos 
  postRedisplay Nothing

fill :: GLfloat -> GLfloat -> GLfloat -> IO ()
fill r g b = color $ Color3 r g b

vertex2 :: GLfloat -> GLfloat -> IO ()
vertex2 x y = vertex $ Vertex3 x y 0

pixelToGLCoord :: Position -> (GLfloat, GLfloat)
pixelToGLCoord (Position x y) = (x', y') where
  x' = -(w - fromIntegral x)/w
  y' = -fromIntegral y/h
  [w, h] = fromIntegral <$> [width, height]

toRect :: (GLfloat, GLfloat) -> [(GLfloat, GLfloat)]
toRect (x, y) = [(x+d, y), (x, y+d), (x-d, y), (x, y-d)] where
  d = 0.07

