{-# LANGUAGE
    EmptyDataDecls
  , TypeFamilies
  , FlexibleContexts
  , FlexibleInstances
  , ScopedTypeVariables
  #-}

module HPari.Internal.Pari 
  ( Pari(..)
  )
where

import Foreign.C.Types ( CLong(..) )
import Foreign.Ptr (Ptr)


type Gen = Ptr CLong

class Pari a where  
  newPari :: Gen -> a  

  withPari :: a
           -> (Gen -> IO b)
           -> IO (a,b)



