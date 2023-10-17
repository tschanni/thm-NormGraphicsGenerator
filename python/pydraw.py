import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import MultipleLocator, FormatStrFormatter
from matplotlib.ticker import FormatStrFormatter
from help_funcs import *


def drawPaper(
    default: int = None,
    x_lim_min: float = None,
    x_lim_max: float = None,
    y_lim_min: float = None,
    y_lim_max: float = None,
    scale_interm: bool = None,
    x_label: str = None,
    y_label: str = None,
    x_shift: float = None,
    y_shift: float = None,
    **kwargs
    ):

    # default values 
    _fontsize_legend = 10
    _fontsize = 10
    DP = 2
    inch = 1/2.54  # centimeters in inches
    offset = 0.4*inch
    global fig, ax

    # get kwargs
    # x_lim_min =  kwargs.get('x_lim_min',None)
    # x_lim_max =  kwargs.get('x_lim_max',None)
    # y_lim_min =  kwargs.get('y_lim_min',None)
    # y_lim_max =  kwargs.get('y_lim_max',None)   

    # scale_interm = kwargs.get('scale_intermediate_ticks',None)
    
    # x_label = kwargs.get('x_label',None)
    # y_label = kwargs.get('y_label',None)
    
    # x_shift = kwargs.get('x_shift',None)
    # y_shift = kwargs.get('y_shift',None)
    
    # default = kwargs.get('default',None)

    # set default values if not given
    if x_lim_min == None:
        x_lim_min = -4
    if x_lim_max == None:
        x_lim_max = 4
    if y_lim_min == None:
        y_lim_min = -4
    if y_lim_max == None:
        y_lim_max = 4
    if scale_interm == None:
        scale_interm = 0
    if x_label == None:
        x_label = 'x'
    if y_label == None:
        y_label = 'y'
    if x_shift == None:
        x_shift = 0
    if y_shift == None:
        y_shift = 0

    # set values/warnings if given
    if x_lim_min != None:
        if x_lim_min > x_lim_max:
            print('x_lim_min > x_lim_max')
    if x_lim_max != None:   
        if x_lim_max < x_lim_min:
            print('x_lim_max < x_lim_min')
    if y_lim_min != None:
        if y_lim_min > y_lim_max:
            print('y_lim_min > y_lim_max')
    if y_lim_max != None:
        if y_lim_max < y_lim_min:
            print('y_lim_max < y_lim_min')
    if scale_interm != None:
        if scale_interm == True:
            scale_interm = 1
        elif scale_interm == False:
            scale_interm = 0
        else:
            print('scale_interm =',scale_interm,'not found')
    if x_label != None:
        if x_label == '':
            print('x_label is empty')
    if y_label != None: 
        if y_label == '':
            print('y_label is empty')

    # switch/case for default
    if default == 1:
        #platzhalter
        print('default 1')
    elif default == 2:
        print('default 2')
    elif default == 3:
        print('default 3')
    elif default == None:
        print('default None')
    else:
        #warning
        print('default',default,'not found')

    xlim = x_lim_min, x_lim_max
    ylim = y_lim_min, y_lim_max

    width = xlim[1]-xlim[0]
    height = ylim[1]-ylim[0]
    fig_size = width*inch+offset,height*inch+offset

    # create figure
    fig = plt.figure(figsize=fig_size,dpi=100, facecolor='w', edgecolor='k')
    plt.subplots_adjust(
        left=-0, 
        right=1, 
        top=0.98, 
        bottom=0.02, 
        wspace=0, 
        hspace=0)
    #fig.canvas.draw()
    ax = plt.gca()

    # set up axis
    ax.spines['left'].set_position('zero')
    ax.spines['right'].set_color('none')
    # ax.spines['bottom'].set_position(('data', 6))
    ax.spines['bottom'].set_position('zero')
    ax.spines['top'].set_color('none')
    ax.xaxis.set_ticks_position('bottom')
    ax.yaxis.set_ticks_position('left')

    ax.set_axisbelow(True)
    ax.set_aspect('equal')

    #set bounds
    ax.set_ybound(ylim[0],ylim[1])
    ax.set_xbound(xlim[0],xlim[1])
    ax.set_xlim(xlim[0],xlim[1])
    ax.set_ylim(ylim[0],ylim[1])

    # Berechnung der Anzahl der Ticks basierend auf dem gewünschten Abstand
    desired_tick_spacing = 0.5  # 0,5 cm gewünschter Abstand
    x_num_ticks = int((xlim[1] - xlim[0]) / desired_tick_spacing)
    y_num_ticks = int((ylim[1] - ylim[0]) / desired_tick_spacing)

    # Setzen der Tick-Abstände
    ax.xaxis.set_major_locator(MultipleLocator((xlim[1] - xlim[0]) / x_num_ticks))
    ax.yaxis.set_major_locator(MultipleLocator((ylim[1] - ylim[0]) / y_num_ticks))
    # ax.set_xticks(np.arange(xlim[0], xlim[1], grid_size_cm))
    # ax.set_yticks(np.arange(ylim[0], ylim[1], grid_size_cm))
    ax.xaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7',zorder=0)
    ax.yaxis.grid(True,'major',linewidth=1,linestyle='-',color='#d7d7d7')

    # "Millimeter Papier"
    # ax.xaxis.set_minor_locator(MultipleLocator( (1/4) / 5 ))
    # ax.yaxis.set_minor_locator(MultipleLocator( (1/4) / 5 ))
    # ax.xaxis.grid(True,'minor',linewidth=0.5/DP,linestyle='-',color='#d7d7d7')
    # ax.yaxis.grid(True,'minor',linewidth=0.5/DP,linestyle='-',color='#d7d7d7')

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
        else:
            yticklist[n] = replace_decimal_places(label.get_text())
            ax.set_yticklabels(yticklist)
    
    # only one zero
    ax.xaxis.get_ticklabels()[1].set_visible(False)

    # set labels
    ax.set_xlabel(x_label,fontsize=_fontsize,position=(4,0),loc='right')
    ax.set_ylabel(y_label,fontsize=_fontsize,position=(0,4),loc='top')
    #ax.xaxis.set_label_coords(.9, -.1)
