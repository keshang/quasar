import sys
import os
import time
import re
from datetime import datetime as dt, timedelta
import pandas as pd
import numpy as np
from numpy import nan as NaN
import pylab as pl
import statsmodels.api as sm
import sklearn
import matplotlib.pyplot as plt
import matplotlib
import statsmodels.api as sm
import sqlobject
import patsy
import math

# needed to print utf8-chars with pandas.
# import sys
# reload(sys)
# sys.setdefaultencoding('utf-8')

#matplotlib.rcParams['figure.figsize'] = (3, 2)
#matplotlib.rcParams['savefig.dpi'] = 100

from IPython.display import display
from IPython.display import SVG
from IPython.display import Image

# from pyquasar import *

# Sensible float formats
pd.set_option('display.float_format', lambda x: '%.2f' % x)
pd.set_option('mode.chained_assignment',None)
np.set_printoptions(precision=2)
np.set_printoptions(suppress=True)


## pretty plots
from mpltools import style
style.use('ggplot')


# import matplotlib as mpl
# mpl.rcParams['axes.color_cycle'] = ('#002D6A', '#4B004B', '#9BC6E7', '#BE54BE', '#A8CA00', '#FF9200', '#613700')
