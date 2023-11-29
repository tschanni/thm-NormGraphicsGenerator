from pydraw import *
import matplotlib.pyplot as plt
import numpy as np

drawPaper(default=3,x_label='t in s',y_label='U in V',x_tick_spacing=2,x_tick_multiplicator=0.5,y_tick_spacing=2,y_tick_multiplicator=0.5)

# generate x values
x = np.arange(-2*np.pi,2*np.pi,0.01)
x2 = np.arange(0,10,0.01)

# compute y values
y = 10*np.sin(x)
y2 = np.cos(x2)

# plot x and y
plt.plot(x, y, label='sin')
plt.plot(x2,y2, label='cos')

# get a legend of the sin and cos plot
plt.legend(loc='upper right', shadow=True)

# save the plot
plt.savefig("python_example1.png",bbox_inches='tight') # need to be before show()

# show the plot
plt.show()
