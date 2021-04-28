#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script de comparação dos resultados gerados.
"""

import numpy as np

import rasterio as rio
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D

ds_30062020 = rio.open("sits/30-06-2020/classification-results/Sinop_probs_class_bayesian_2013_9_2014_8_v1.tif")
ds_02122020 = rio.open("sits/02-12-2020/classification-results/Sinop_probs_class_bayesian_2013_9_2014_8_v1.tif")

arr_30062020 = ds_30062020.read()
arr_02122020 = ds_02122020.read()

diff = arr_30062020 - arr_02122020

diff[diff != 0] = 2
diff[diff == 0] = 1
diff[diff == 2] = 0
diff = diff.astype(int)

#
# Original figure (a)
#
plt.figure(dpi = 300)
plt.imshow(arr_30062020[0, :, :], cmap = 'Paired', interpolation = 'none')

plt.axis('off')
frame1 = plt.gca()
frame1.axes.xaxis.set_ticklabels([])
frame1.axes.yaxis.set_ticklabels([])

plt.savefig('verification/results/map_30062020.pdf', dpi=600, bbox_inches='tight', pad_inches=0.0)

#
# Original figure (b)
#
plt.figure(dpi = 300)
plt.imshow(arr_02122020[0, :, :], cmap = 'Paired', interpolation = 'none')

plt.axis('off')
frame1 = plt.gca()
frame1.axes.xaxis.set_ticklabels([])
frame1.axes.yaxis.set_ticklabels([])

plt.savefig('verification/results/map_02122020.pdf', dpi=600, bbox_inches='tight', pad_inches=0.0)

#
# Difference Figure
#
plt.figure(dpi = 300)
plt.imshow(diff[0, :, :], cmap = 'tab20c', interpolation='none')

plt.axis('off')
frame1 = plt.gca()
frame1.axes.xaxis.set_ticklabels([])
frame1.axes.yaxis.set_ticklabels([])

# legend
cmap = plt.cm.tab20c

custom_lines = [Line2D([0], [0], color=cmap(20), lw=2),
                Line2D([0], [0], color=cmap(1), lw=2)]
plt.legend(custom_lines, ['Valor Igual', 'Valor Diferente'])

# save!
plt.savefig('verification/results/difference_map.pdf', dpi=600, bbox_inches='tight', pad_inches=0.0)

#
# metrics
#
# pip install sewar
from sewar.full_ref import mse
from sewar.full_ref import rmse

# MSE
mse_val = mse(arr_30062020, arr_02122020)

# RMSE
rmse_val = rmse(arr_30062020, arr_02122020)

# count pixels
print(np.count_nonzero(diff == 0))
print(np.count_nonzero(diff == 1))
