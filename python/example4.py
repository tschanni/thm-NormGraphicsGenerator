import matplotlib.pyplot as plt
import numpy as np
from pydraw import *

drawPaper(x_lim_min=0,x_lim_max=1.75,y_lim_max=1.5,y_lim_min=-1.5,x_label='t / s',y_label='i / A',tick_spacing=0.25)
x = np.arange(0,1.5,0.01)
y = 1*np.sin(2*np.pi*x)
# create a sin that fits in the x range

plt.plot(x,y)
plt.savefig("example4_1.png")
plt.show() 