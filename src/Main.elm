module Main exposing (..)
import Browser
import Html exposing (Html)

main = 
    Browser.sandbox 
    { init = ""
     ,view = view,
    ,update = update
 }

view data = 
    Html.text data 
    