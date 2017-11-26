module GLPipeline where

import Foreign.Marshal.Array(withArray)
import Graphics.UI.GLUT
import Data.IORef
import Control.Monad
--import Data.Bitmap


import Types
import Utils
import LoadShaders
import Vertices


pipelineSetup :: IO Descriptor
pipelineSetup = do
  let cube = cubeHeight 1
  colors <- forM cube $ \_ -> randomColor

  -- compile and link shader program
  program <- loadShaders [
     ShaderInfo VertexShader (FileSource "vertex.glsl"),
     ShaderInfo FragmentShader (FileSource "fragment.glsl")]
  currentProgram $= Just program

  -- VAO
  vao <- genObjectName
  bindVertexArrayObject $= Just vao

  setupPositionData program cube

  setupColorData program colors

  position (Light 1) $= Vertex4 1.0 1.0 1.0 1.0

  -- -- textures
  -- textureBuffer <- genObjectName
  -- bindBuffer TextureBuffer $= Just textureBuffer
  -- texture Texture2D $= Enabled

  -- withBitmap bm $
  --   \(w, h) nchn pad ptr -> do
  --     texImage2D Texture2D NoProxy 0 RGB8
  --       (TextureSize2D (fromIntegral w) (fromIntegral h)) 0
  --       (PixelData RGB UnsignedByte ptr)

  -- textureFilter Texture2D $= ((Linear', Nothing), Nearest)



  -- texcoord attrib (2d, for each vertex)
  -- texLoc <- get $ attribLocation program "texcoord"
  -- vertexAttribPointer texLoc $=
  --   (ToFloat,
  --    VertexArrayDescriptor 4 Float 0 (bufferOffset 0))
  -- -- enable the location (a block of bytes in the VBO via the above pointer)
  -- vertexAttribArray texLoc $= Enabled

  -- rotation angles ioref
  avref <- newIORef $ Vector3 0 0 (0 :: Float)

  -- color rgb ioref
  colref <- newIORef $ Vector3 0 0 (1 :: Float)

  return
    Descriptor
    { descAngles = avref
    , descColor = colref
    , descProgram = program
    , descVAO = vao
    , descNVertices = fromIntegral (numVertices cube)
    }


setupPositionData :: Program -> [Vertex3 GLfloat] -> IO ()
setupPositionData program pvs = do
    -- VBO, copy the position data
  posBuffer <- genObjectName
  bindBuffer ArrayBuffer $= Just posBuffer
  withArray pvs $ \ptr -> do
    let size = fromIntegral (numVertices pvs * vertexSize pvs)
    bufferData ArrayBuffer $= (size, ptr, StaticDraw)

  -- position attrib
  posLoc <- get $ attribLocation program "vPosition"
  vertexAttribPointer posLoc $=
    (ToFloat,
     VertexArrayDescriptor 3 Float 0 (bufferOffset 0))
  -- enable the location (a block of bytes in the VBO via the above pointer)
  vertexAttribArray posLoc $= Enabled


setupColorData :: Program -> [Vertex3 GLfloat] -> IO ()
setupColorData program cvs = do
  buff <- genObjectName
  bindBuffer ArrayBuffer $= Just buff
  withArray cvs $ \ptr -> do
    let size = fromIntegral (numVertices cvs * vertexSize cvs)
    bufferData ArrayBuffer $= (size, ptr, StaticDraw)

  -- position attrib
  atloc <- get $ attribLocation program "vColor"
  vertexAttribPointer atloc $=
    (ToFloat,
     VertexArrayDescriptor 3 Float 0 (bufferOffset 0))
  vertexAttribArray atloc $= Enabled
