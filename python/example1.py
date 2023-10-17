import pydraw as draw
import matplotlib.pyplot as plt
import numpy as np

draw.drawPaper(x_cm_min=0)

# generate x values
x = np.arange(-10, 10, 0.01)
x2 = np.arange(-10,10,0.01)

# compute y values
y = np.sin(x)
y2 = np.cos(x2)

# plot x and y
plt.plot(x, y)
plt.plot(x2,y2)

# save the plot
plt.savefig("example8_1.png") # need to be before show()
# show the plot
plt.show()
