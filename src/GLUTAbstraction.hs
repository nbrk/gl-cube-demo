module GLUTAbstraction where

import Graphics.UI.GLUT
import Data.IORef

import Types
import GLPipeline


glutPrepare :: IO ()
glutPrepare = do
  (progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [ RGBAMode ]
  initialWindowSize $= Size 512 512
  initialContextVersion $= (4, 3)
  initialContextProfile $= [ CoreProfile ]
  _ <- createWindow progName

  descriptor <- pipelineSetup


--  depthFunc $= Just Less
  displayCallback $= display descriptor
  specialCallback $= Just (specKeyDown descriptor)


glutLoop :: IO ()
glutLoop = mainLoop

----

display :: Descriptor -> DisplayCallback
display (Descriptor avref prog vao numvs) = do
--  clear [ ColorBuffer, DepthBuffer ]
  clear [ ColorBuffer ]

  -- get angles verctor from IORef
  (Vector3 ax ay az) <- get avref


  -- set angles for the shader program
  rotAngles <- get $ uniformLocation prog "rotAngles"
  uniform rotAngles $= Vector3 ax ay az

  polygonMode $= (Line, Line)
  drawArrays Triangles 0 numvs
  flush


specKeyDown :: Descriptor -> SpecialCallback
specKeyDown (Descriptor avref _ _ _) KeyLeft _ = avref $~ (\(Vector3 ax ay az) -> Vector3 ax (ay-0.1) az) >> p
specKeyDown (Descriptor avref _ _ _) KeyRight _ = avref $~ (\(Vector3 ax ay az) -> Vector3 ax (ay+0.1) az) >> p
specKeyDown (Descriptor avref _ _ _) KeyUp _ = avref $~ (\(Vector3 ax ay az) -> Vector3 (ax+0.1) ay az) >> p
specKeyDown (Descriptor avref _ _ _) KeyDown _ = avref $~ (\(Vector3 ax ay az) -> Vector3 (ax-0.1) ay az) >> p
specKeyDown _ _ _ = return ()

p = postRedisplay Nothing
