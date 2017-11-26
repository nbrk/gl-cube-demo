module Vertices where

import Graphics.UI.GLUT
import System.Random


--   -- attr data
-- vertices' :: [Vertex2 GLfloat]
-- vertices' =
--   [ Vertex2 (-0.5) (0.5) 
--   , Vertex2 (0.5) (0.5)
--   , Vertex2 (0.5) (-0.5)
--   , Vertex2 (-0.5) (-0.5)
--   ]

-- with textcoord
-- vertices'' :: [Vertex4 GLfloat]
-- vertices'' =
--   [ Vertex4 (-0.5) (0.5) 0 1
--   , Vertex4 (0.5) (0.5) 1 1

--   , Vertex4 (0.5) (0.5) 1 1
--   , Vertex4 (0.5) (-0.5) 1 0

--   , Vertex4 (0.5) (-0.5) 1 0
--   , Vertex4 (-0.5) (-0.5) 0 0

--   , Vertex4 (-0.5) (-0.5) 0 0
--   , Vertex4 (-0.5) (0.5) 0 1
--   ]

-- vertices'' :: [GLfloat]
-- vertices'' =
--   [  (-0.5), (0.5), 0, 1
--   ,  (0.5), (0.5), 1, 1

-- --  ,  (0.5), (0.5), 1, 1
--   ,  (0.5), (-0.5), 1, 1

-- --  ,  (0.5), (-0.5), 1, 0
--   ,  (-0.5), (-0.5), 0, 0

-- --  ,  (-0.5), (-0.5), 0, 0
-- --  ,  (-0.5), (0.5), 0, 1
--   ]


-- vertices :: [Vertex3 GLfloat]
-- vertices =
--   [
--     Vertex3 (-0.5) (0.5) (-0.5)
--   , Vertex3 (-0.5) (-0.5) (-0.5)
--   , Vertex3 (0.5) (-0.5) (-0.5)
--   , Vertex3 (0.5) (-0.5) (-0.5)
--   , Vertex3 (-0.5) (0.5) (-0.5)
--   , Vertex3 (0.5) (0.5) (-0.5)
--   ]


randomColor :: IO (Vertex3 GLfloat)
randomColor = do
  r <- randomRIO (0, 1)
  g <- randomRIO (0, 1)
  b <- randomRIO (0, 1)
  return $ Vertex3 r g b

cubeHeight :: Float -> [Vertex3 GLfloat]
cubeHeight h =
  [
    Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2) (-h/2)  (h/2)
  , Vertex3 (-h/2)  (h/2)  (h/2)
  , Vertex3 (h/2)  (h/2) (-h/2)
  , Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2)  (h/2) (-h/2)
  , Vertex3 (h/2) (-h/2)  (h/2)
  , Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (h/2) (-h/2) (-h/2)
  , Vertex3 (h/2)  (h/2) (-h/2)
  , Vertex3 (h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2)  (h/2)  (h/2)
  , Vertex3 (-h/2)  (h/2) (-h/2)
  , Vertex3 (h/2) (-h/2)  (h/2)
  , Vertex3 (-h/2) (-h/2)  (h/2)
  , Vertex3 (-h/2) (-h/2) (-h/2)
  , Vertex3 (-h/2)  (h/2)  (h/2)
  , Vertex3 (-h/2) (-h/2)  (h/2)
  , Vertex3 (h/2) (-h/2)  (h/2)
  , Vertex3 (h/2)  (h/2)  (h/2)
  , Vertex3 (h/2) (-h/2) (-h/2)
  , Vertex3 (h/2)  (h/2) (-h/2)
  , Vertex3 (h/2) (-h/2) (-h/2)
  , Vertex3 (h/2)  (h/2)  (h/2)
  , Vertex3 (h/2) (-h/2)  (h/2)
  , Vertex3 (h/2)  (h/2)  (h/2)
  , Vertex3 (h/2)  (h/2) (-h/2)
  , Vertex3 (-h/2)  (h/2) (-h/2)
  , Vertex3 (h/2)  (h/2)  (h/2)
  , Vertex3 (-h/2)  (h/2) (-h/2)
  , Vertex3 (-h/2)  (h/2)  (h/2)
  , Vertex3 (h/2)  (h/2)  (h/2)
  , Vertex3 (-h/2)  (h/2)  (h/2)
  , Vertex3 (h/2) (-h/2)  (h/2)
  ]
