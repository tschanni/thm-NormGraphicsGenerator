import matplotlib.pyplot as plt
import numpy as np
from pydraw import *

# Variant 1: array of complex numbers
z1 = [4+4j,14+1j,10+15j]
# Variant 2: arrange an array of complex numbers
z2 = np.arange(5) + 1j*np.arange(5,10)
# Variant 3: one complex number
z3 = 1+1j

# drawArgand(z1)
drawArgand(z2)
# drawArgand(z3)

plt.show()