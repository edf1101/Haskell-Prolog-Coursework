import Data.List
import Data.Char

digits :: Int -> [Int]
digits n
  | n < 10 = [n]
  | otherwise = digits (n `div` 10) ++ [ n `mod` 10]


generator2 :: [(Int, Int, Int, Int, Int, Int, Int, Int)]
generator2 = 
  [ (a1, a2, a3, a4, a5, a6, a7, a8) |
  a1 <- validNumbers,
  a2 <- validNumbers, a2 /= a1,
  a3 <- validNumbers, a3  `notElem` [a1,a2],
  a4 <- validNumbers, a4  `notElem` [a1,a2,a3], a4 == minimum [a1, a2, a3, a4],
  a5 <- validNumbers, a5  `notElem` [a1,a2,a3,a4], a4 == minimum [a1, a2, a3, a4, a5],
  a6 <- validNumbers, a6  `notElem` [a1,a2,a3,a4,a5], a4 == minimum [a1, a2, a3, a4, a5, a6],
  a7 <- validNumbers, a7  `notElem` [a1,a2,a3,a4,a5,a6], a4 == minimum [a1, a2, a3, a4, a5, a6, a7],
  a8 <- validNumbers, a8  `notElem` [a1,a2,a3,a4,a5,a6,a7], a4 == minimum [a1, a2, a3, a4, a5, a6, a7, a8]]
  where
    validSquare x = length(nub (digits (x^2))) == 3
    validNumbers = filter validSquare [10..31]


selector2 :: (Int, Int, Int, Int, Int, Int, Int, Int) -> Bool
selector2 (a1, a2, a3, a4, a5, a6, a7, a8) =
    digitInCommon a1 a2 && digitInCommon a1 a3 && digitInCommon a1 a4 && digitInCommon a1 a5 && not (digitInCommon a1 a6 ) && not (digitInCommon a1 a7 ) && not (digitInCommon a1 a8) &&
    digitInCommon a2 a3 && digitInCommon a2 a4 && digitInCommon a2 a5 && digitInCommon a2 a6 && not (digitInCommon a2 a7) && digitInCommon a2 a8 &&
    not (digitInCommon a3 a4) && not (digitInCommon a3 a5 )&& not (digitInCommon a3 a6 ) && digitInCommon a3 a7 &&not (digitInCommon a3 a8) &&
    digitInCommon a4 a5  && digitInCommon a4 a6 && not (digitInCommon a4 a7 ) && digitInCommon a4 a8  && 
    digitInCommon a5 a6  &&  not (digitInCommon a5 a7 ) && digitInCommon a5 a8 &&
    not (digitInCommon a6 a7 ) &&digitInCommon a6 a8 &&
    digitInCommon a7 a8
        where
        digitInCommon a b =
            length (nub (a_s ++ b_s)) /= length a_s + length b_s
            where
            a_s = nub(show (a^2))
            b_s = nub(show (b^2))

