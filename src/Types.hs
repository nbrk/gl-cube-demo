module Types where

import Graphics.UI.GLUT
import Data.IORef

data Descriptor = Descriptor
  { descAngles :: IORef (Vector3 Float)
  , descColor :: IORef (Vector3 Float)
  , descProgram ::Program
  , descVAO :: VertexArrayObject
  , descNVertices :: NumArrayIndices
  }
