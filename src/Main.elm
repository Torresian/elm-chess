module Main exposing (..)

import Html exposing (div, ul, li, text, Html)
import Html.Attributes exposing (style)
import List exposing (..)


main =
    let
        colStyle =
            ( "display", "inline-block" )
    in
        div []
            (concat
                (repeat 4
                    [ div [ style [ colStyle ] ] (concat (repeat 4 [ square "white", square "black" ]))
                    , div [ style [ colStyle ] ] (concat (repeat 4 [ square "black", square "white" ]))
                    ]
                )
            )


square color =
    let
        sizePx =
            100
    in
        div
            [ style
                [ ( "width", (toString sizePx) ++ "px" )
                , ( "height", (toString sizePx) ++ "px" )
                , ( "background-color", color )
                ]
            ]
            []
