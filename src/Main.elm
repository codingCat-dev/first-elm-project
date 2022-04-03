module Main exposing (..)

import Browser
import Html
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


initModel : Model
initModel =
    { message = "Welcome"
    , firstname = ""
    }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }


type Msg
    = MsgSurprise
    | MsgReset
    | MsgNewName String


type alias Model =
    { message : String
    , firstname : String
    }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.text model.message
        , Html.input [ onInput MsgNewName, value model.firstname ] []
        , Html.button [ onClick MsgSurprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgSurprise ->
            { model
                | message = "Happy Birthday " ++ model.firstname ++ " !!"
            }

        MsgReset ->
            initModel

        MsgNewName newName ->
            { model
                | firstname = newName
            }
