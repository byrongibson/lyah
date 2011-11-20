--p.~300

module ApplyLog
(applyLog)
where

import Data.Monoid

applyLog :: (Monoid m) => (a,m) -> (a -> (b,m)) -> (b,m)
applyLog (x, log) f = let (y, newlog) = f x in (y, mappend log newlog)
