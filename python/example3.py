import matplotlib.pyplot as plt
import numpy as np
from pydraw import *

# Example of an argand diagram with a variation of complex numbers as an input

# Variant 1: array of complex numbers
z1 = [4+4j,14+1j,10+15j]
# Variant 2: arrange an array of complex numbers
z2 = np.arange(5) + 1j*np.arange(5,10)
# Variant 3: one complex number
z3 = 1+1j

# drawArgand(z1)
drawArgand(z2)
# drawArgand(z3)

plt.savefig("example3_1.png",bbox_inches='tight')
plt.show()