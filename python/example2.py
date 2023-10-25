from pydraw import *
import matplotlib.pyplot as plt
import numpy as np

drawPaper(x_lim_min=-4,x_lim_max=4,y_lim_min=-4,y_lim_max=4,x_label='real',y_label='imag',scale_interm=0)

# draw a arrow (for complex numbers)
plt.arrow(0, 0, 1, 1, head_width=0.05, head_length=0.1, fc='r', ec='r', length_includes_head=True)
plt.arrow(1, 1, -2, 2, head_width=0.05, head_length=0.1, fc='b', ec='b', length_includes_head=True)
plt.arrow(0, 0, -1, 3, head_width=0.05, head_length=0.1, fc='g', ec='g', length_includes_head=True)

plt.savefig("example2_2.png") # need to be before show()
plt.show()