import matplotlib.pyplot as plt
import numpy as np
from pydraw import *
from scipy import signal

# Example of different waves

drawPaper(x_lim_min=-1,x_lim_max=10,y_lim_max=2.5,y_lim_min=-2.5,
          x_label='t / ms',y_label='u / u\u209C\u1D63',
          x_tick_spacing=2,
          y_tick_multiplicator=0.5)

# create a sine wave
x = np.arange(0,9.5,0.01)
y = 2*np.sin(x)
plt.plot(x,y)

# create a sawtooth wave 
y2 = 2*signal.sawtooth(x)
plt.plot(x,y2)

# create a square wave
y3 = 2*signal.square(x)
plt.plot(x,y3)

plt.savefig("example4_2.png",bbox_inches="tight")
plt.show() 