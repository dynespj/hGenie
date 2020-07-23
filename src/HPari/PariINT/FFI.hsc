{-# LANGUAGE
    CApiFFI
  , EmptyDataDecls
  , FlexibleInstances
  , ForeignFunctionInterface
  , MultiParamTypeClasses
  , TupleSections
  , TypeFamilies
  #-}

module HPari.PariINT.FFI
where

#include <pari/pari.h>

import Foreign.C.String ( CString )
import Foreign.C.Types ( CLong(..)
                       , CULong(..)
                       , CInt(..) )
import Foreign.ForeignPtr ( ForeignPtr
                          , addForeignPtrFinalizer
                          , withForeignPtr
                          , newForeignPtr )
import Foreign.Ptr ( Ptr, FunPtr )
import System.IO.Unsafe ( unsafePerformIO )

import HPari.Internal.Pari
import HPari.Utils


data PariINT = PariINT {-#UNPACK #-} !(ForeignPtr CLong)

instance Pari PariINT where
  {-# INLINE newPari #-}
  newPari ptr = PariINT $ unsafePerformIO $
                newForeignPtr p_destroyer ptr

  {-# INLINE withPari #-}
  withPari (PariINT a) f =
    withForeignPtr a $ \aptr ->
    f aptr >>= return . (PariINT a,)

{-# INLINE newPariINT #-}
newPariINT :: Gen -> PariINT
newPariINT = newPari

{-# INLINE withPariINT #-}
withPariINT :: PariINT -> (Gen -> IO b) -> IO (PariINT, b)
withPariINT = withPari


foreign import capi "pari/pari.h value gen_0"
  gen_0 :: Gen

foreign import capi "pari/pari.h value gen_1"
  gen_1 :: Gen

foreign import capi "pari/pari.h value gen_m1"
  gen_m1 :: Gen

foreign import capi "pari/pari.h value gen_2"
  gen_2 :: Gen

foreign import capi "pari/pari.h value gen_m2"
  gen_m2 :: Gen
  
foreign import ccall "pari/pari.h stoi"
  stoi :: CLong -> IO ( Gen )

foreign import ccall "pari/pari.h gadd"
  gadd :: Gen -> Gen -> IO ( Gen )

foreign import ccall "pari/pari.h gsub"
  gsub :: Gen -> Gen -> IO ( Gen )

foreign import ccall "pari/pari.h gmul"
  gmul :: Gen -> Gen -> IO ( Gen )

foreign import ccall "pari/pari.h gneg"
  gneg :: Gen -> IO ( Gen )

foreign import ccall "pari/pari.h gabs"
  gabs :: Gen -> IO ( Gen )

foreign import ccall "pari/pari.g gsigne"
  gsigne :: Gen -> IO ( CLong )
