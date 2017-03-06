module Main exposing (..)

import Html exposing (div, h1, text, Html)
import Html.Attributes exposing (style)


main : Html msg
main =
    div []
        [ chessboard
        ]


chessboard : Html msg
chessboard =
    div
        [ style
            [ ( "background-image", "url(/assets/board.svg)" )
            , ( "height", "360px" )
            , ( "width", "360px" )
            , ( "margin", "auto" )
            ]
        ]
        [ blackPawn
        , blackPawn
        , blackPawn
        , blackPawn
        , blackPawn
        , blackPawn
        , blackPawn
        , blackPawn
        ]


blackPawn : Html msg
blackPawn =
    div
        [ style
            [ ( "background-image", "url(/assets/black-pawn.svg)" )
            , ( "height", "45px" )
            , ( "width", "45px" )
            ]
        ]
        []
