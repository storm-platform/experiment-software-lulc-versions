#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script de comparação dos resultados gerados.
"""

import numpy as np

import rasterio as rio

ds_30062020 = rio.open("../sits/30-06-2020/classification-results/Sinop_probs_class_bayesian_2013_9_2014_8_v1.tif")
ds_02122020 = rio.open("../sits/02-12-2020/classification-results/Sinop_probs_class_bayesian_2013_9_2014_8_v1.tif")

arr_30062020 = ds_30062020.read()
arr_02122020 = ds_02122020.read()

diff = arr_30062020 - arr_02122020

diff[diff != 0] = 2
diff[diff == 0] = 1
diff[diff == 2] = 0
diff = diff.astype(np.float32)

profile = ds_30062020.profile
profile["dtype"] = "float32"

with rio.open("results/difference_raster.tiff", 'w', **profile) as file:
    file.write(diff)
