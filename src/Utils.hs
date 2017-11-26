module Utils where

import Foreign.Ptr
import Foreign.Storable

bufferOffset :: Integral a => a -> Ptr b
bufferOffset = plusPtr nullPtr . fromIntegral

numVertices l = length l
--numVertices l = 4
vertexSize l = sizeOf (head l)
--vertexSize l = 2
