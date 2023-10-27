from pydraw import *
import matplotlib.pyplot as plt
import numpy as np

drawPaper(default=3,x_label='t in s',y_label='U in V',no_scale=False)

# generate x values
x = np.arange(-2*np.pi,2*np.pi,0.01)
x2 = np.arange(0,10,0.01)

# compute y values
y = 10*np.sin(x)
y2 = np.cos(x2)

# plot x and y
plt.plot(x, y, label='sin')
plt.plot(x2,y2, label='cos')

# plt.legend(('sin', 'cos'), loc='upper right', shadow=True)

# save the plot
plt.savefig("example1_3.png") # need to be before show()

# show the plot
plt.show()
