> import Data.List
> import Crypto.Hash.MD5
> import qualified Data.ByteString.Char8 as B
> import Data.Hex
> import Data.Typeable
> import Data.Maybe

--- Day 4: The Ideal Stocking Stuffer ---

Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the economically forward-thinking little girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes. The input to the MD5 hash is some secret key (your puzzle input, given below) followed by a number in decimal. To mine AdventCoins, you must find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash.

For example:

If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so.
If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....

--- Part Two ---

Now find one that starts with six zeroes.

---------------------------------------------------------

> main = print $ succ $ fromJust $ findIndex (zeroes 6) $ map hexHash $ seqList "ckczppom"

List of natural numbers prepended with a string.

> seqList :: String -> [String]
> seqList s = map ((s++) . show) [1..]

Checks if a string starts with x zeroes.

> zeroes :: Int -> String -> Bool
> zeroes a = (all (=='0')) . (take a)

Computes the MD5 hash of a String and returns the result in a hex String.

> hexHash :: String -> String
> hexHash = hex . B.unpack . hash . B.pack
