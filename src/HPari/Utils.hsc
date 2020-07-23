{-# LANGUAGE
    CApiFFI
  , EmptyDataDecls
  , FlexibleInstances
  , ForeignFunctionInterface
  , MultiParamTypeClasses
  , TupleSections
  , TypeFamilies
  #-}


module HPari.Utils where

import Foreign.C.Types ( CLong(..), CULong(..), CInt(..) )
import Foreign.Ptr ( Ptr, FunPtr )

type Gen = Ptr CLong


foreign import ccall "pari/pari.h pari_init"
    pari_init :: CInt -> CULong -> IO ()
           
foreign import ccall "pari/pari.h pari_close"
    pari_close :: IO ()

foreign import ccall "csrc/pari_define_wrappers.h myprinter"
    myprinter :: Gen -> IO ()

foreign import ccall "csrc/pari_define_additionals.h destroyer"
    destroyer :: Gen -> IO ()

foreign import ccall "csrc/pari_define_additionals.h &destroyer"
    p_destroyer :: FunPtr(Gen -> IO ())


