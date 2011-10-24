-- p.248

-- data CoolBool = CoolBool {getCoolBool :: Bool} deriving (Show)
newtype CoolBool = CoolBool {getCoolBool :: Bool} deriving (Show)

testCoolBool :: CoolBool -> String
testCoolBool (CoolBool False) = "test failed."
testCoolBool (CoolBool _) = "test passed."
