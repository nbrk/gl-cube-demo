module Vertices where

import Graphics.UI.GLUT
import Foreign.Storable(sizeOf)

  -- attr data
vertices' :: [Vertex2 GLfloat]
vertices' =
  [ Vertex2 (-0.5) (0.5)
  , Vertex2 (0.5) (0.5)
  , Vertex2 (0.5) (-0.5)
  , Vertex2 (-0.5) (-0.5)
  ]

vertices :: [Vertex3 GLfloat]
vertices =
  [
    Vertex3 (-0.5) (0.5) (-0.5)
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (0.5) (-0.5) (-0.5)
  , Vertex3 (0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5) (0.5) (-0.5)
  , Vertex3 (0.5) (0.5) (-0.5)
  ]




cube :: [Vertex3 GLfloat]
cube =
  [
    Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5) (-0.5)  0.5
  , Vertex3 (-0.5)  0.5  0.5
  , Vertex3 0.5  0.5 (-0.5)
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5)  0.5 (-0.5)
  , Vertex3 0.5 (-0.5)  0.5
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 0.5 (-0.5) (-0.5)
  , Vertex3 0.5  0.5 (-0.5)
  , Vertex3 0.5 (-0.5) (-0.5)
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5)  0.5  0.5
  , Vertex3 (-0.5)  0.5 (-0.5)
  , Vertex3 0.5 (-0.5)  0.5
  , Vertex3 (-0.5) (-0.5)  0.5
  , Vertex3 (-0.5) (-0.5) (-0.5)
  , Vertex3 (-0.5)  0.5  0.5
  , Vertex3 (-0.5) (-0.5)  0.5
  , Vertex3 0.5 (-0.5)  0.5
  , Vertex3 0.5  0.5  0.5
  , Vertex3 0.5 (-0.5) (-0.5)
  , Vertex3 0.5  0.5 (-0.5)
  , Vertex3 0.5 (-0.5) (-0.5)
  , Vertex3 0.5  0.5  0.5
  , Vertex3 0.5 (-0.5)  0.5
  , Vertex3 0.5  0.5  0.5
  , Vertex3 0.5  0.5 (-0.5)
  , Vertex3 (-0.5)  0.5 (-0.5)
  , Vertex3 0.5  0.5  0.5
  , Vertex3 (-0.5)  0.5 (-0.5)
  , Vertex3 (-0.5)  0.5  0.5
  , Vertex3 0.5  0.5  0.5
  , Vertex3 (-0.5)  0.5  0.5
  , Vertex3 0.5 (-0.5)  0.5
  ]
