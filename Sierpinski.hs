-- Sierpinski triangle in Haskell
-- http://blog.fogus.me/2011/08/14/perlis-languages/

sierpinski 0 = ["*"]
sierpinski n = map ((space ++) . (++ space)) down ++
               map (unwords . replicate 2) down
    where down = sierpinski (n - 1)
          space = replicate (2 ^ (n - 1)) ' '

main = mapM_ putStrLn $ sierpinski 4
