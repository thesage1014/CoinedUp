class Multiplication:
    """
    Instantiate a multiplying class.
    """

    def __init__(self, base: int) -> None:
        self.base = base

    def multiply(self, multiplier: int) -> int:
        """
        Multiply a number by multiplier

        """

        return self.base * multiplier


"""
Usage:
```
from coinedupengine import *

m = Multiplication(2)
print(m.multiply(4))
```
"""
