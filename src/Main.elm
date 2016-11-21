module Main exposing (..)

import Html exposing (div, ul, li, text, Html)
import Html.Attributes exposing (style)
import List exposing (..)


main =
    div []
        [ board
        , piecesHtml startingPieces
        ]


piecesHtml : Pieces -> Html a
piecesHtml rows =
    rows
        |> List.map rowToHtml
        |> div [ style [ ( "font-size", "250%" ), ( "text-align", "center" ), ( "line-height", "1.2" ) ] ]


rowToHtml : List (Maybe Piece) -> Html a
rowToHtml row =
    let
        colStyle =
            ( "display", "inline-block" )
    in
        row
            |> List.map pieceContainer
            |> div [ style [ colStyle ] ]


pieceToText : Maybe Piece -> String
pieceToText piece =
    case piece of
        Just p ->
            "♙"

        Nothing ->
            ""


pieceContainer maybePiece =
    let
        pieceString =
            pieceToText maybePiece

        sizePx =
            50
    in
        div
            [ style
                [ ( "width", (toString sizePx) ++ "px" )
                , ( "height", (toString sizePx) ++ "px" )
                ]
            ]
            [ text pieceString ]


board =
    let
        colStyle =
            ( "display", "inline-block" )
    in
        div
            [ style
                [ ( "font-size", "250%" )
                , ( "text-align", "center" )
                , ( "line-height", "1.2" )
                ]
            ]
            (concat
                (repeat 4
                    [ div [ style [ colStyle ] ] (concat (repeat 4 [ square "white", square "silver" ]))
                    , div [ style [ colStyle ] ] (concat (repeat 4 [ square "silver", square "white" ]))
                    ]
                )
            )


square color =
    let
        sizePx =
            50
    in
        div
            [ style
                [ ( "width", (toString sizePx) ++ "px" )
                , ( "height", (toString sizePx) ++ "px" )
                , ( "background-color", color )
                ]
            ]
            []



--- CHESS MODEL


type Figure
    = Pawn
    | Rook
    | Knight
    | Bishop
    | Queen
    | King


type Colour
    = Black
    | White


type alias Piece =
    ( Colour, Figure )


type alias Pieces =
    List (List (Maybe Piece))


toPiece : Char -> Maybe Piece
toPiece char =
    case char of
        'R' ->
            Just ( Black, Rook )

        'H' ->
            Just ( Black, Knight )

        'B' ->
            Just ( Black, Bishop )

        'Q' ->
            Just ( Black, Queen )

        'K' ->
            Just ( Black, King )

        'P' ->
            Just ( Black, Pawn )

        'r' ->
            Just ( White, Rook )

        'h' ->
            Just ( White, Knight )

        'b' ->
            Just ( White, Bishop )

        'q' ->
            Just ( White, Queen )

        'k' ->
            Just ( White, King )

        'p' ->
            Just ( White, Pawn )

        _ ->
            Nothing


readLine : String -> List (Maybe Piece)
readLine str =
    str
        |> String.toList
        |> List.map toPiece


readPieces : String -> Pieces
readPieces str =
    str
        |> String.trim
        |> String.split "\n"
        |> List.map readLine


startingPieces : Pieces
startingPieces =
    readPieces
        """
RHBQKBHR
PPPPPPPP
........
........
........
........
pppppppp
rhbqkbhr
        """
