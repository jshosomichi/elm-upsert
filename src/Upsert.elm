module Upsert exposing (merge, upsert)

-- Common


upsert : (a -> a -> Bool) -> (a -> a -> a) -> a -> List a -> List a
upsert predicate calc target items =
    if List.any (predicate target) items then
        merge predicate calc target items
    else
        List.append items [ target ]


merge : (a -> a -> Bool) -> (a -> a -> a) -> a -> List a -> List a
merge predicate calc target items =
    case items of
        [] ->
            items

        x :: xs ->
            if predicate x target then
                calc x target :: merge predicate calc target xs
            else
                x :: merge predicate calc target xs
