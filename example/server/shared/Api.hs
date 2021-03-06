{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

module Api where

import Elm.Export
import           GHC.Generics                  (Generic)
import           Data.Aeson                    (FromJSON, ToJSON)
import Data.Text


data TaskStatus
  = Ready
  | InPlay
  | Done
  deriving (Eq, Show, Generic, ElmType)

instance ToJSON TaskStatus

instance FromJSON TaskStatus

data Task
  = Task
  { id :: Int
  , name :: Text
  , description :: Text
  , status :: TaskStatus
  } deriving (Eq, Show, Generic, ElmType)

instance ToJSON Task

instance FromJSON Task


data Request
  = CreateTaskRequest Text Text
  | LoadAllTasksRequest
  deriving (Eq, Show, Generic, ElmType)

instance FromJSON Request

newtype Response
  = Response
  { tasks :: [Task]
  } deriving (Eq, Show, Generic, ElmType)

instance ToJSON Response
