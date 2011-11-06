-- p.274


-- reverse function call order: specify parameters first, then function
x -: f = f x

type Birds = Int
type Pole  = (Birds, Birds)

-- add/subtract birds from left side of pole (use negative num to subract)
landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

-- add/subtract birds from right side of pole
landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise = Nothing

