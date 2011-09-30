-- p.138
--load libeq.hs

module TrafficLight
( TrafficLight(..)
) where

data TrafficLight = Red | Yellow | Green

instance Eq' TrafficLight where
    Red     === Red     = True
    Yellow  === Yellow  = True
    Green   === Green   = True
    _ === _ = False

instance Show TrafficLight where
    Show Red = "Red Light"
    Show Yellow = "Yellow Light"
    Show Green = "Green Light"


