module Sale exposing (Sale, eqEmployees, mergeSales)


type alias Sale =
    { employeeId : String, amount : Int }


eqEmployees : Sale -> Sale -> Bool
eqEmployees a b =
    a.employeeId == b.employeeId


mergeSales : Sale -> Sale -> Sale
mergeSales a b =
    Sale a.employeeId (a.amount + b.amount)
