import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator
import numpy as np
from pydraw import *


# def argand(a):
#     for x in range(len(a)):
#         plt.plot([0,a[x].real],[0,a[x].imag],'ro-',label='python')
#     limit=np.max(np.ceil(np.absolute(a))) # set limits for axis
#     plt.xlim((-limit,limit))
#     plt.ylim((-limit,limit))
#     plt.ylabel('Imaginary')
#     plt.xlabel('Real')
#     plt.show()

# a = np.arange(5) + 1j*np.arange(6,11)
# argand(a)
# plt.show()
a = np.arange(5) + 1j*np.arange(6,11)
z = 5+6j
print(len(a))
drawArgand(z)