-- p.239

import Control.Applicative

sequenceA :: (Applicative f) => [f a] -> f [a]
sequenceA [] = pure []
sequenceA (x:xs) = (:) <$> x <*> sequenceA xs

-- same as sequenceA, but implemented with foldr
sequenceB :: (Applicative f) => [f a] -> f [a]
sequenceB = foldr (liftA2 (:)) (pure [])


