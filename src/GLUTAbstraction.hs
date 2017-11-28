module GLUTAbstraction where

import Graphics.UI.GLUT
import Data.IORef
import Codec.Image.STB

import Types
import GLPipeline


glutPrepare :: IO ()
glutPrepare = do
  (progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [ RGBAMode, WithDepthBuffer ]
  initialWindowSize $= Size 512 512
  initialContextVersion $= (4, 2)
  initialContextProfile $= [ CoreProfile ]
  _ <- createWindow progName

  -- (Right bm) <- loadImage "crate.jpg"
  -- putStrLn $ "Loaded image: " ++ show bm

  descriptor <- pipelineSetup


  depthFunc $= Just Less
  displayCallback $= display descriptor
  specialCallback $= Just (specKeyDown descriptor)


glutLoop :: IO ()
glutLoop = mainLoop

----

display :: Descriptor -> DisplayCallback
display d = do
--  clear [ ColorBuffer, DepthBuffer ]
  clear [ ColorBuffer, DepthBuffer ]

  -- get angles verctor from IORef
  (Vector3 ax ay az) <- get $ descAngles d

  -- set angles for the shader program
  rotAngles <- get $ uniformLocation (descProgram d) "rotAngles"
  uniform rotAngles $= Vector3 ax ay az

--  polygonMode $= (Line, Line)
--  drawArrays TriangleFan 0 numvs
  drawArrays Triangles 0 (descNVertices d)
--  drawArrays LineLoop 0 numvs
  flush


specKeyDown :: Descriptor -> SpecialCallback
specKeyDown d KeyLeft _ = (descAngles d) $~ (\(Vector3 ax ay az) -> Vector3 ax (ay-0.1) az) >> p
specKeyDown d KeyRight _ = (descAngles d) $~ (\(Vector3 ax ay az) -> Vector3 ax (ay+0.1) az) >> p
specKeyDown d KeyUp _ = (descAngles d) $~ (\(Vector3 ax ay az) -> Vector3 (ax+0.1) ay az) >> p
specKeyDown d KeyDown _ = (descAngles d) $~ (\(Vector3 ax ay az) -> Vector3 (ax-0.1) ay az) >> p
specKeyDown _ _ _ = return ()

p = postRedisplay Nothing
