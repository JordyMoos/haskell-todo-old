module Main (main) where

import Options.Applicative

type ItemIndex = Int

defaultDataPath :: FilePath
defaultDataPath = "./.todo.yaml"

dataPathParser :: Parser FilePath
dataPathParser = strOption $
  value defaultDataPath
  <> long "data-path"
  <> short 'p'
  <> metavar "DATAPATH"
  <> help ("path to data file (default " ++ defaultDataPath ++ ")")

itemIndexParser :: Parser ItemIndex
itemIndexParser = argument auto (metavar "ITEMINDEX" <> help "index of item")

main :: IO ()
main = do
  -- itemIndex <- execParser (info itemIndexParser (progDesc "Todo list manager"))
  dataPath <- execParser (info dataPathParser (progDesc "Todo list manager"))
  putStrLn $ "dataPath=" ++ show dataPath
