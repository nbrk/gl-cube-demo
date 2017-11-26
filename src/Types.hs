module Types where

import Graphics.UI.GLUT
import Data.IORef

data Descriptor = Descriptor (IORef (Vector3 Float)) Program VertexArrayObject NumArrayIndices
