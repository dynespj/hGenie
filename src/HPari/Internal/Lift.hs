{-# LANGUAGE
    BangPatterns
  , FlexibleContexts
  , FlexibleInstances
  , ScopedTypeVariables
  , TypeFamilies
  #-}

module HPari.Internal.Lift
  ( liftPari 
  , lift2Pari
  )
where


import Foreign.C.Types ( CLong(..) )
import Foreign.Ptr ( Ptr )
import System.IO.Unsafe ( unsafePerformIO )

import HPari.Internal.Pari


type Gen = Ptr CLong

--------------------------------------------------
--- Pari* -> Pari*
--------------------------------------------------

liftPari :: Pari a => ( Gen -> IO ( Gen ) ) -> a -> a
liftPari f (!x) = newPari $ unsafePerformIO $
                  fmap snd $ withPari x $ \xptr ->
                  f xptr

--------------------------------------------------
--- Pari* -> Pari* -> Pari*
--------------------------------------------------

{-# INLINE lift2Pari #-}
lift2Pari :: Pari a => ( Gen -> Gen -> IO ( Gen ) ) -> a -> a -> a
lift2Pari f (!x) (!y) = newPari $ unsafePerformIO $
                        fmap snd $ withPari x $ \xptr ->
                        fmap snd $ withPari y $ \yptr ->
                        f xptr yptr        
