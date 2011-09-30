-- p.

module PhoneBook 
( PhoneBook
, PhoneNumber
, Name
, inPhoneBook
) where 

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name phoneNumber phoneBook = (name,phoneNumber) `elem` phoneBook


