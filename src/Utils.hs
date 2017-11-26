module Utils where

import Foreign.Ptr
import Foreign.Storable

bufferOffset :: Integral a => a -> Ptr b
bufferOffset = plusPtr nullPtr . fromIntegral

numVertices l = length l
vertexSize l = sizeOf (head l)
