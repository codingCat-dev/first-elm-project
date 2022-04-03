module Main exposing (..)

import Browser
import Html


main =
    Browser.sandbox
        { init = "Welcome to the browser!"
        , view = view
        , update = update
        }


view data =
    Html.text data


update msg data =
    "Testing"
