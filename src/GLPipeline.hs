module GLPipeline where

import Foreign.Marshal.Array(withArray)
import Graphics.UI.GLUT
import Data.IORef

import Types
import Utils
import LoadShaders
import Vertices


pipelineSetup :: IO Descriptor
pipelineSetup = do
  -- VAO
  vao <- genObjectName
  bindVertexArrayObject $= Just vao

  -- VBO, copy the data
  arrayBuffer <- genObjectName
  bindBuffer ArrayBuffer $= Just arrayBuffer
  withArray cube $ \ptr -> do
    let size = fromIntegral (numVertices cube * vertexSize cube)
    bufferData ArrayBuffer $= (size, ptr, StaticDraw)

  -- compile and link shader program
  program <- loadShaders [
     ShaderInfo VertexShader (FileSource "vertex.glsl"),
     ShaderInfo FragmentShader (FileSource "fragment.glsl")]
  currentProgram $= Just program

  --  setup access rules for fetching of our data
  vertexAttribPointer (AttribLocation 0) $=
    (ToFloat,
     VertexArrayDescriptor 3 Float 0 (bufferOffset 0))
  -- enable the location (a block of bytes in the VBO via the above pointer)
  vertexAttribArray (AttribLocation 0) $= Enabled

  -- rotation angles ioref
  avref <- newIORef $ Vector3 0 0 (0 :: Float)

  return $
    Descriptor avref program vao (fromIntegral (numVertices cube))


