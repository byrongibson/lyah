-- p.284
--

justH :: Maybe Char
justH = do
    (x:xs) <- Just "Hello"
    return x


