module Main exposing (..)

import Browser
import Html
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


initModel : Model
initModel =
    { message = "Welcome"
    , firstname = Nothing
    , age = Nothing
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
    , firstname : Maybe String
    , age : Maybe Int
    }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.text model.message
        , Html.input [ onInput MsgNewName, value (Maybe.withDefault "" model.firstname) ] []
        , Html.input [ onInput MsgNewAgeAssString, value (String.fromInt (Maybe.withDefault 0 model.age)) ] []
        , Html.button [ onClick MsgSurprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        , Html.text (String.fromInt (String.length (Maybe.withDefault "" model.firstname)))
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgSurprise ->
            case model.age of
                Just anAge ->
                    case model.firstname of
                        Just aName ->
                            { model
                                | message = "Happy Birthday " ++ aName ++ " with " ++ String.fromInt anAge ++ "years old !!"
                            }

                        Nothing ->
                            { model
                                | message = "First name is required"
                            }

                Nothing ->
                    { model
                        | message = "Age is required"
                    }

        MsgReset ->
            initModel

        MsgNewName newName ->
            if String.trim newName == "" then
                { model
                    | firstname = Nothing
                }

            else
                { model
                    | firstname = Just newName
                }

        MsgNewAgeAssString newValue ->
            case String.toInt newValue of
                Just anInt ->
                    { model
                        | age = Just anInt
                    }

                Nothing ->
                    { model
                        | message = "The Age is wrong"
                        , age = Nothing
                    }
