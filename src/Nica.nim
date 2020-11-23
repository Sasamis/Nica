type Matrix* = seq[seq[int]]
type MatrixDifferentRowsError* = object of CatchableError
type MatrixDifferentColumnsError* = object of CatchableError

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

proc hello* (): string =
  result = "Hello, Nica!"