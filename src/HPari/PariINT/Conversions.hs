module HPari.PariINT.Conversions
where

import Foreign.C.Types ( CLong(..) )
import Foreign.ForeignPtr ( newForeignPtr )
import System.IO.Unsafe ( unsafePerformIO )

import HPari.PariINT.FFI
import HPari.Utils

fromCLongToPariINT :: CLong -> PariINT
fromCLongToPariINT l = unsafePerformIO $
  stoi l >>= (\ptr ->
  newForeignPtr p_destroyer ptr >>= (\fptr -> 
  return $ PariINT fptr))
