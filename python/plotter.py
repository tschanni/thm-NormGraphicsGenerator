import matplotlib.pyplot as plt
import numpy as np

class plot:
    def __init__(self, x, y, title, xlabel, ylabel):
        self.x = x
        self.y = y
        self.title = title
        self.grid = [True, '--', 0.5, 'gray', 0.5] # standart Karo mit kleinen Kästchen
        self.xlabel = xlabel
        self.ylabel = ylabel

    def plot(self):
        plt.plot(self.x, self.y)
        plt.title(self.title)
        plt.xlabel(self.xlabel)
        plt.ylabel(self.ylabel)
        plt.grid(self.grid)
        plt.show()  # show the plot      

    def setgrid(self, visible, linestyle, linewidth, color, alpha):   
        pass

        
obj = plot(np.linspace(0, 2 * np.pi, 200), np.sin(np.linspace(0, 2 * np.pi, 200)), 'Sinus', 'x', 'y')
obj.plot()

#