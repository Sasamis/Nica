import unittest

import Nica

test "correct hello":
  check Nica.hello() == "Hello, Nica!"
