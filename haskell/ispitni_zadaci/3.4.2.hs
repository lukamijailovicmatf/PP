-- Napraviti biblioteku funkcija za rad sa bankarskim transakcijama. Svaka transakcija se sastoji od identifikatora, iznosa i brojeva računa pošiljaoca i primaoca. U okviru
-- biblioteke je neophodno isporučiti tip podataka koji predstavlja transakciju, kolekciju izvršenih transakcija, kao i funkcije za listanje, izvršavanje i poništavanje
-- transakcija.
-- Implementirati (bez rekurzije, koristeći funkcije višeg reda):
-- 1. prikazivi tip podataka Transakcija (podrazumevano instancira Show i Eq) sa konstruktorom MkTransakcija i poljima: ident (identifikator, ceo broj, jedinstven za svaku
-- transakciju), iznos (ceo broj), posiljalac (niska koja predstavlja broj računa pošiljaoca) i primalac (niska koja predstavlja broj računa primaoca);
-- 2. tip podataka AktivneTransakcije koji predstavlja alias za kolekciju transakcija;
-- 3. funkciju izlistaj ts br, čiji je tip izlistaj :: AktivneTransakcije -> String -> [Transakcija] koja vraća sve transakcije iz aktivnih transakcija (ts) u kojima figuriše dati
-- broj računa (br), bilo kao pošiljalac ili primalac;
-- 4. funkciju dodaj ts t, čiji je tip dodaj :: AktivneTransakcije -> Transakcija -> AktivneTransakcije koja dodaje transakciju (t) na početak spiska aktivnih transakcija (ts) i
-- vraća modifikovani spisak transakcija;
-- 5. funkciju ukloni ts ident, čiji je tip ukloni :: AktivneTransakcije -> Int -> AktivneTransakcije koja uklanja transakciju sa datim identifikatorom (ident) iz spiska aktivnih
-- transakcija (ts) i vraća modifikovani spisak transakcija;
-- 6. funkciju ukupno ts, čiji je tip ukupno :: AktivneTransakcije -> Int koja računa ukupni iznos svih transakcija

data Transakcija = MkTransakcija { ident :: Int,
                                   iznos :: Int,
                                   posiljalac :: String,
                                   primalac :: String
                                 } deriving (Show, Eq)
                                 
type AktivneTransakcije = [Transakcija]

izlistaj :: AktivneTransakcije -> String -> [Transakcija]
izlistaj ts br = filter (\t -> posiljalac t == br || primalac t == br) ts

dodaj :: AktivneTransakcije -> Transakcija -> AktivneTransakcije
dodaj ts t = t : ts

ukloni :: AktivneTransakcije -> Int -> AktivneTransakcije
ukloni ts i = filter (\t -> ident t /= i) ts

ukupno :: AktivneTransakcije -> Int
ukupno ts = sum (map iznos ts)
