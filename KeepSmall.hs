--p.329
--

import Control.Monad.Trans.Writer.Lazy

keepSmall :: Int -> Writer [String] Bool
keepSmall x 
    | x < 4 = do
        tell ["Keeping " ++ show x]
        return True
    | otherwise = do
        tell ["Too large, discarding " ++ show x]
        return False


