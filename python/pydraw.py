import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator
from help_funcs import *
import numpy as np


def drawPaper(
    default: int = None,
    x_lim_min: float = None,
    x_lim_max: float = None,
    y_lim_min: float = None,
    y_lim_max: float = None,
    scale_interm: bool = None,
    x_label: str = None,
    y_label: str = None,
    tick_spacing: float = None,
    no_scale : bool = False
    ):

    # default values 
    _fontsize = 10
    inch = 1/2.54  # centimeters in inches
    offset = 0.4*inch
    _def = False
    global fig, ax

    # switch/case for default
    if default == 1:
        x_lim_min_def = -1
        x_lim_max_def = 7
        y_lim_min_def = -1
        y_lim_max_def = 7
        _def = True
    elif default == 2:
        x_lim_min_def = -1
        x_lim_max_def = 7
        y_lim_min_def = -4
        y_lim_max_def = 4
        _def = True
    elif default == 3:
        x_lim_min_def = -8
        x_lim_max_def = 8
        y_lim_min_def = -12
        y_lim_max_def = 12
        _def = True
    # elif default == 4:
    #     x_lim_min_def = 
    elif default == None:
        _def = False
    else:
        #warning
        print('default',default,'not found')

    # overwrite default value, set warnings and set defaults if not given
    if x_lim_min != None and _def == True:
        x_lim_min_def = x_lim_min
    elif x_lim_min != None and x_lim_min > 0:
        print('x_lim_min cant be > 0')
    elif x_lim_min == None:
        x_lim_min = -4
        
    if x_lim_max != None and _def == True:
        x_lim_max_def = x_lim_max
    elif x_lim_max != None and x_lim_max < 0:
        print('x_lim_max cant be < 0')
    elif x_lim_max == None:
        x_lim_max = 4

    if y_lim_min != None and _def == True:
        y_lim_min_def = y_lim_min
    elif y_lim_min != None and y_lim_min > 0:
        print('y_lim_min cant be > 0')
    elif y_lim_min == None:
        y_lim_min = -4
    
    if y_lim_max != None and _def == True:
        y_lim_max_def = y_lim_max
    elif y_lim_max != None and y_lim_max < 0:
        print('y_lim_max cant be < 0')
    elif y_lim_max == None:
        y_lim_max = 4

    if scale_interm == None:
        scale_interm = 0
    else:
        if scale_interm == True:
            scale_interm = 1
        elif scale_interm == False:
            scale_interm = 0
        else:
            print('scale_interm =',scale_interm,'not found')

    if x_label == None:
        x_label = 'x'
    elif x_label == '':
        print('x_label is empty')
    if y_label == None:
        y_label = 'y'
    elif y_label == '':
        print('y_label is empty')

    # set values
    if _def == False:
        xlim = x_lim_min, x_lim_max
        ylim = y_lim_min, y_lim_max
    else:
        xlim = x_lim_min_def, x_lim_max_def
        ylim = y_lim_min_def, y_lim_max_def

    width = xlim[1]-xlim[0]
    height = ylim[1]-ylim[0]
    fig_size = width*inch+offset,height*inch+offset


    # create figure
    fig = plt.figure(figsize=fig_size,dpi=105, facecolor='w', edgecolor='k')
    fig.tight_layout()

    plt.subplots_adjust(
        left=0, 
        right=1, 
        top=0.98, 
        bottom=0.02, 
        wspace=0, 
        hspace=0
    )
    
    # plt.margins(0,0)
    #fig.canvas.draw()
   

    # set up axis
    ax = plt.gca()
    ax.spines['left'].set_position('zero') # Y-Achses set to zero
    # ax.spines['left'].set_position(('data', -3))
    ax.spines['right'].set_color('none') #disabled
    ax.spines['bottom'].set_position('zero') # X-Achses set to zero
    # ax.spines['bottom'].set_position(('data', -3))
    ax.spines['top'].set_color('none') #disabled
    ax.xaxis.set_ticks_position('bottom')
    ax.yaxis.set_ticks_position('left')
    ax.set_axisbelow(True)
    ax.set_aspect('equal')

    #set bounds
    ax.set_xlim(xlim[0],xlim[1])
    ax.set_ylim(ylim[0],ylim[1])
    # ax.set_ybound(ylim[0],ylim[1])
    # ax.set_xbound(xlim[0],xlim[1])

    # Calculate number of ticks
    if tick_spacing == None:
        _tick_spacing = 0.5  # 0,5 cm gewünschter Abstand
    else:
        _tick_spacing = tick_spacing
        
    # x_num_ticks = int((xlim[1] - xlim[0]) / desired_tick_spacing)
    # y_num_ticks = int((ylim[1] - ylim[0]) / desired_tick_spacing)

    # Space between ticks
    # ax.xaxis.set_major_locator(MultipleLocator((xlim[1] - xlim[0]) / x_num_ticks))
    # ax.yaxis.set_major_locator(MultipleLocator((ylim[1] - ylim[0]) / y_num_ticks))
    ax.xaxis.set_major_locator(MultipleLocator(0.5))
    ax.yaxis.set_major_locator(MultipleLocator(0.5))
    # Grid
    ax.xaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7',zorder=0)
    ax.yaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7')

    # "Millimeter Papier"
    ax.xaxis.set_minor_locator(MultipleLocator(_tick_spacing))
    ax.yaxis.set_minor_locator(MultipleLocator(_tick_spacing))
    ax.xaxis.grid(True,'minor',linewidth=0.5,linestyle='-',color='#d7d7d7')
    ax.yaxis.grid(True,'minor',linewidth=0.5,linestyle='-',color='#d7d7d7')

    # Display Tick labels
    xticklist = ax.get_xticks().tolist()
    for n, label in enumerate(ax.xaxis.get_ticklabels()):
        if count_decimal_places(label.get_text()) > scale_interm:
            label.set_visible(False)
        else:
            xticklist[n] = replace_decimal_places(label.get_text())
            ax.set_xticklabels(xticklist)

    yticklist = ax.get_yticks().tolist()
    for n, label in enumerate(ax.yaxis.get_ticklabels()):
        if count_decimal_places(label.get_text()) > scale_interm:
            label.set_visible(False)
        elif label.get_text() == '0.0':
            label.set_visible(False)
        else:
            yticklist[n] = replace_decimal_places(label.get_text())
            ax.set_yticklabels(yticklist)
    
    # remove every tick label when no scale is true
    if no_scale == True:
        for i, label in enumerate(ax.xaxis.get_ticklabels()):
            label.set_visible(False)
        for i, label in enumerate(ax.yaxis.get_ticklabels()):
            label.set_visible(False)

    else:
        # remove last tick label
        ax.xaxis.get_ticklabels()[-1].set_visible(False)
        ax.yaxis.get_ticklabels()[-1].set_visible(False)
        ax.xaxis.labelpad = 0
        ax.yaxis.labelpad = -7 # - -> moving right


    # set labels
    ax.set_xlabel(x_label,fontsize=_fontsize,position=(4,0),loc='right')
    ax.set_ylabel(y_label,fontsize=_fontsize,position=(0,4),loc='top')

    # set arrow tips
    ax.plot(1, 0, ">k", transform=ax.get_yaxis_transform(), clip_on=False)
    ax.plot(0, 1, "^k", transform=ax.get_xaxis_transform(), clip_on=False)



def drawArgand(z: None):
    # create a polar plot
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='polar')

    limit = np.max(np.ceil(np.absolute(z))) # set limits for axis
    r = np.array([0, limit])  # set the radius to 0 and 10
    ax.plot(np.ones(2) *np.pi / 2, r, color='black')
    ax.plot(-(np.ones(2) * np.pi / 2),r, color='black')
    ax.plot(np.ones(2) * np.pi, r, color='black')
    ax.plot(np.ones(2) *0, r, color='black')

    # set arrow tips
    ax.plot(np.ones(2) * 0, np.ones(2) * r[-1], ">k", transform=ax.get_yaxis_transform(), clip_on=False)
    ax.plot(np.ones(2) * np.pi * 1.6711, np.ones(2) * r[-1], "^k", transform=ax.get_yaxis_transform(), clip_on=False)
    # ax.xaxis.set_major_locator(MultipleLocator(1/2))
    ax.yaxis.set_major_locator(MultipleLocator(1/2))
    ax.xaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7',zorder=0)
    ax.yaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7')
    # change position of the ticks
    ax.set_rlabel_position(0)  # get radial labels away from plotted line
    # reduce tick labels
    yticklist = ax.get_yticks().tolist()

    for n, label in enumerate(ax.yaxis.get_ticklabels()):
        if count_decimal_places(label.get_text()) > 0: # scale_interm var
            label.set_visible(False)
        elif label.get_text() == '0.0':
            label.set_visible(False)
        else:
            yticklist[n] = replace_decimal_places(label.get_text())
            ax.set_yticklabels(yticklist)

    # check if type of z is complex or not
    if isinstance(z, complex):
        plt.polar([0,np.angle(z)],[0,abs(z)],marker='o')
    elif len(z) > 1:
        for x in z:
            # plt.plot([0,z[x].real],[0,z[x].imag],'ro-',label='python')
            plt.polar([0,np.angle(x)],[0,abs(x)],marker='o')
            # print('x: {:.2f}'.format(x))
    else:
        print('z is not complex or an array')
