import os
import MatrixModule

type Image* = object
  matrix: Matrix
  color: Matrix

proc readPNM* (path: string): Image =
  let file: File = open(path, FileMode.fmRead)
  defer:
    close file
  var data: seq[string] = @[]
  var matrix: Matrix = @[]
  for i in 0..3:
    data.add file.readLine()
  echo data
  result = Image(matrix: @[], color: @[])