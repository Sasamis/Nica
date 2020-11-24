type Matrix* = seq[seq[int]]
type MatrixDifferentRowsError* = object of CatchableError
type MatrixDifferentColumnsError* = object of CatchableError
type MartixTheInnerProductError* = object of CatchableError

proc sameStructure (left, right: Matrix) =
  if left.len != right.len:
    raise newException(MatrixDifferentRowsError, "Matrix-type additions must have the same number of rows.")
  for index in 0..<left.len:
    if left[index].len != right[index].len:
      raise newException(MatrixDifferentColumnsError, "Matrix-type additions must have the same number of columns.")

proc `+`* (left, right: Matrix): Matrix =
  sameStructure left, right
  result = @[]
  for index1 in 0..<left.len:
    var row: seq[int] = @[]
    for index2 in 0..<left[index1].len:
      row.add left[index1][index2] + right[index1][index2]
    result.add row

proc `-`* (left, right: Matrix): Matrix =
  sameStructure left, right
  result = @[]
  for index1 in 0..<left.len:
    var row: seq[int] = @[]
    for index2 in 0..<left[index1].len:
      row.add left[index1][index2] - right[index1][index2]
    result.add row

proc `*`* (left, right: Matrix): Matrix =
  let
    left_row = left.len
    left_column = left[0].len
    right_column = right[0].len

  if left_column != right.len:
    raise newException(MartixTheInnerProductError, "The inner product cannot be calculated because the number of columns in left and rows in right is different.")

  result = @[]
  for i in 0..<left_row:
    var row: seq[int] = @[]
    for j in 0..<right_column:
      var inner_product = 0
      for k in 0..<left_column:
        inner_product += left[i][k] * right[k][j]
      row.add inner_product
    result.add row

proc hello* (): string =
  result = "Hello, Nica!"