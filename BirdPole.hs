-- p.274

-- Pierre the pole balancing trapeze artist
-- If too many birds land one side of his pole, he'll lose balance and fall.
-- If he steps on a banana peel, he'll slip and fall.

type Birds = Int
type Pole  = (Birds, Birds)

-- reverse function call order: specify parameters first, then function
x -: f = f x

-- chain several events together
--routine :: Maybe Pole -> Maybe Pole
--routine Nothing = Nothing
--routine (Just (left, right)) = do
routine :: Pole -> Maybe Pole
routine (left, right) = do
    start <- return (left, right) 
    first <- landLeft 2 start
    second <- landRight 3 first
    -- banana <- second
    -- third <- banana 
    third <- landLeft 1 second
    fourth <- landRight (-1) third
    landLeft (-1) fourth

-- add/subtract birds from left side of pole (use negative num to subract)
landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right) 
    | abs ((left + n) - right) < 4 = Just (left+n, right)
    | otherwise = Nothing
     
-- add/subtract birds from right side of pole
landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right+n)
    | otherwise = Nothing

-- slips on banana peel
banana :: Pole -> Maybe Pole
banana _ = Nothing

