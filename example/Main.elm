module Main exposing (main)

import Html exposing (Html, div, text)
import Upsert exposing (merge, upsert)
import Sale exposing (..)


main : Html msg
main =
    let
        a =
            Sale "a" 3000

        b =
            Sale "e" 2000

        sales =
            [ Sale "a" 2500, Sale "b" 1500, Sale "c" 3000, Sale "d" 4000 ]

        nextSales =
            sales
                |> upsert eqEmployees mergeSales a
                |> upsert eqEmployees mergeSales b
    in
    div []
        [ div [] [ text <| toString nextSales ]
        ]
