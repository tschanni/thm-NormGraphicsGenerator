import matplotlib.pyplot as plt
import numpy as np
from matplotlib import ticker






def var1():
    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)
    

    # Major ticks every 20, minor ticks every 5
    major_ticks = np.arange(0, 101, 5)
    minor_ticks = np.arange(0, 101, 1)

    ax.set_xticks(major_ticks)
    ax.set_xticks(minor_ticks, minor=True)
    ax.set_yticks(major_ticks)
    ax.set_yticks(minor_ticks, minor=True)

    # And a corresponding grid
    ax.grid(which='both')

    # Or if you want different settings for the grids:
    ax.grid(which='minor', alpha=0.2)
    ax.grid(which='major', alpha=0.5)
    plt.show()

def var2():
    x = np.arange(0, 4, 0.05)
    y = np.sin(x*np.pi)

    fig, ax = plt.subplots(figsize=(3,2), constrained_layout=True)
    ax.plot(x, y)
    ax.set_xlabel('t [s]')
    ax.set_ylabel('S [V]')
    ax.set_title('Sine wave')
    fig.set_facecolor('lightsteelblue')

    # set xticks & yticks
    ax.set(xticks=x, yticks=np.arange(-1, 1, 0.5))

    # draw grid
    for loc in x:
        ax.axvline(loc, alpha=0.8, color='#36454F', linestyle='-', linewidth=0.5)
        ax.axhline(loc, alpha=0.8, color='#36454F', linestyle='-', linewidth=0.5)
    
    plt.show()


def var3():
    x = np.arange(0, 4, 0.05)
    y = np.sin(x*np.pi)

    fig, ax = plt.subplots(figsize=(3,2), constrained_layout=True)
    ax.plot(x, y)
    ax.set_xlabel('t [s]')
    ax.set_ylabel('S [V]')
    ax.set_title('Sine wave')
    fig.set_facecolor('lightsteelblue')
    
    # set grid
    minor_ticks = np.arange(-4, 4, 0.05)

    ax.set_xticks(minor_ticks)
    ax.set_yticks(minor_ticks)
    ax.set_xlim(-0.5, 4)

    # And a corresponding grid
    ax.grid(which='both')

    # Or if you want different settings for the grids:
    # ax.grid(which='minor', alpha=0.2)

    plt.show()
var3()