module Main exposing (..)

import Browser
import Html
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


initModel : Model
initModel =
    { message = "Welcome"
    , firstname = ""
    , age = 0
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
    | MsgNewAgeAssString String


type alias Model =
    { message : String
    , firstname : String
    , age : Int
    }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.text model.message
        , Html.input [ onInput MsgNewName, value model.firstname ] []
        , Html.input [ onInput MsgNewAgeAssString, value (String.fromInt model.age) ] []
        , Html.button [ onClick MsgSurprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        , Html.text (String.fromInt (String.length model.firstname))
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgSurprise ->
            { model
                | message = "Happy Birthday " ++ model.firstname ++ " with " ++ String.fromInt model.age ++ "years !!"
            }

        MsgReset ->
            initModel

        MsgNewName newName ->
            { model
                | firstname = newName
            }

        MsgNewAgeAssString newValue ->
            case String.toInt newValue of
                Just anInt ->
                    { model
                        | age = anInt
                    }

                Nothing ->
                    { model
                        | message = "The Age is wrong"
                        , age = 0
                    }
