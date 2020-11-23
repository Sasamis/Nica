import unittest

import Nica

test "correct hello":
  check Nica.hello() == "Hello, Nica!"

suite "Matrix type addiction":
  test "Succeed in adding":
    const left: Nica.Matrix = @[@[1, 2], @[3, 4]]
    const right: Nica.Matrix = @[@[5, 6], @[7, 8]]
    const answer: Nica.Matrix = @[@[6, 8], @[10, 12]]
    check left + right == answer

  test "Failure to add different numbers of rows in matrix type":
    const left: Nica.Matrix = @[@[1, 2], @[3, 4], @[5, 6]]
    const right: Nica.Matrix = @[@[7, 8], @[9, 10]]
    expect Nica.MatrixDifferentRowsError:
      discard left + right

  test "Failure to add different numbers of columns in matrix type":
    const left: Nica.Matrix = @[@[1, 2, 3], @[4, 5, 6]]
    const right: Nica.Matrix = @[@[7, 8], @[9, 10]]
    expect Nica.MatrixDifferentColumnsError:
      discard left + right

suite "Matrix type subtraction":
  test "Succeed in subtraction":
    const left: Nica.Matrix = @[@[1, 2], @[3, 4]]
    const right: Nica.Matrix = @[@[5, 6], @[7, 8]]
    const answer: Nica.Matrix = @[@[-4, -4], @[-4, -4]]
    check left - right == answer

  test "Failure to subtruct different numbers of rows in matrix type":
    const left: Nica.Matrix = @[@[1, 2], @[3, 4], @[5, 6]]
    const right: Nica.Matrix = @[@[7, 8], @[9, 10]]
    expect Nica.MatrixDifferentRowsError:
      discard left - right

  test "Failure to subtract different numbers of columns in matrix type":
    const left: Nica.Matrix = @[@[1, 2, 3], @[4, 5, 6]]
    const right: Nica.Matrix = @[@[7, 8], @[9, 10]]
    expect Nica.MatrixDifferentColumnsError:
      discard left - right