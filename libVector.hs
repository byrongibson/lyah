-- chp.7 p.121

module Vector
( Vector(..)
, vplus
, dotprod
, vmult
) where

-- why Vector a = and not Vector a a a = ?  explained p.122
data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotprod :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotprod` (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i*m) (j*m) (k*m)


