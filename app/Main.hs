module Main where

import HPari.Utils
import HPari.PariINT
import HPari.PariINT.FFI
import HPari.PariINT.Conversions
import HPari.PariINT.Arithmetic
import Foreign.C.Types ( CLong(..), CULong(..), CInt(..) )

main :: IO ()
main = do
    -- putStrLn "enter value for parisize: "
    -- input1 <- getLine
    -- putStrLn "enter value for maxprime: " 
    -- input2 <- getLine 
    -- let parisize = (read input1 :: CInt)
    -- let maxprime = (read input2 :: CULong)
    let parisize = 10000000 :: CInt
    let maxprime = 2000 :: CULong
    pari_init parisize maxprime
    putStrLn "enter first integer to multiply: "
    ix <- getLine
    let lx = (read ix :: CLong)
    let x = fromCLongToPariINT lx
    putStrLn "enter second integer to multiply: "
    iy <- getLine
    let ly = (read iy :: CLong)
    let y = fromCLongToPariINT ly :: PariINT
    putStrLn "multiplying the above"
    let z = (*) x y
    withPariINT z myprinter
    pari_close
    putStrLn "the end of program"
