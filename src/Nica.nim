include Nicapkg/[MatrixModule, Image]

proc hello* (): string =
  result = "Hello, Nica!"

let img: Image = readPNM("/Users/momiyama/Downloads/circle.pnm")