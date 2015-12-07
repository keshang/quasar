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
# import sqlobject
import patsy
import math

#matplotlib.rcParams['figure.figsize'] = (3, 2)
#matplotlib.rcParams['savefig.dpi'] = 100

from IPython.display import display
from IPython.display import SVG
from IPython.display import Image

# Sensible float formats
pd.set_option('display.float_format', lambda x: '%.2f' % x)
pd.set_option('mode.chained_assignment',None)
np.set_printoptions(precision=2)
np.set_printoptions(suppress=True)