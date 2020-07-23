module HPari.PariINT.Arithmetic
where

import System.IO.Unsafe ( unsafePerformIO )

import HPari.Utils
import HPari.PariINT.FFI
import HPari.PariINT.Conversions
import HPari.Internal.Lift ( liftPari
                           , lift2Pari )

instance Num PariINT where
  {-# INLINE fromInteger #-}
  fromInteger _ =  newPariINT gen_0

  {-# INLINE (+) #-}
  (+) = lift2Pari gadd

  {-# INLINE (-) #-}
  (-) = lift2Pari gsub

  {-# INLINE (*) #-}
  (*) = lift2Pari gmul

  {-# INLINE negate #-}
  negate = liftPari gneg

  {-# INLINE abs #-}
  abs = liftPari gabs

  {-# INLINE signum #-}
  signum _ = newPariINT gen_0
