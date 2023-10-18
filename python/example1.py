import pydraw as draw
import matplotlib.pyplot as plt
import numpy as np

draw.drawPaper(default=2,x_label='t in s',y_label='U in V')

# generate x values
x = np.arange(0, 10, 0.01)
x2 = np.arange(0,10,0.01)

# compute y values
y = np.sin(x)
y2 = np.cos(x2)

# plot x and y
plt.plot(x, y)
plt.plot(x2,y2)

# save the plot
plt.savefig("example1_3.png", bbox_inches='tight',pad_inches = 0) # need to be before show()
# show the plot
plt.show()
