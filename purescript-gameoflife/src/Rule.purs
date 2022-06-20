module Rule where

rule :: Int -> Int -> Int -> Int -> Int
rule 1 0 0 0 = 1
rule 0 1 0 0 = 1
rule 0 0 1 0 = 1
rule 0 0 0 1 = 0
rule _ _ _ _ = 0