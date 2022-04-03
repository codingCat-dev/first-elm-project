module Main exposing (..)

import Browser
import Html
import Html.Events exposing (onClick)


main =
    Browser.sandbox
        { init = "Welcome to the browser!"
        , view = view
        , update = update
        }


type Msg
    = MsgSurprise
    | MsgReset


view data =
    Html.div []
        [ Html.text data
        , Html.button [ onClick MsgSurprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        ]


update msg data =
    case msg of
        MsgSurprise ->
            "Surprise"

        MsgReset ->
            "Reseting"
