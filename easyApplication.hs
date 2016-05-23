{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = 
    do
        cd "c:\\users\\rene\\dev\\haskell\\LazyApplicant"
        shell "gvim -p *.hs LazyApplicantWebsites\\*.hs" empty
        --shell "start cmd /K \"ghci Main.hs\"" empty

