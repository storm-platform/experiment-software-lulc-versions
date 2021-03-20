set.seed(777)
library(sits)

# estimate a model only for bands "ndvi" and "evi"
samples_mt_2bands <- sits_select_bands(samples_mt_4bands, ndvi, evi)
rfor_model <- sits_train(samples_mt_2bands, ml_method = sits_rfor(num_trees = 300))

# Create a data cube from two raster bricks
evi_file <- system.file("extdata/Sinop", "Sinop_evi_2014.tif", package = "inSitu")
ndvi_file <- system.file("extdata/Sinop", "Sinop_ndvi_2014.tif", package = "inSitu")

# Obtain the associated timeline
time_file <- system.file("extdata/Sinop", "timeline_2014.txt", package = "inSitu")
timeline_2013_2014 <- scan(time_file, character(), quiet = TRUE)

# create a raster metadata file based on the information about the files
raster_cube <- sits_cube(type     = "BRICK",
                        name      = "Sinop",
                        satellite = "TERRA",
                        sensor    = "MODIS", 
                        timeline  = timeline_2013_2014, 
                        bands     = c("ndvi", "evi"), 
                        files     = c(ndvi_file, evi_file))

# Classify the raster cube, generating a probability file
probs_cube <- sits_classify(raster_cube, 
                            ml_model   = rfor_model,
                            output_dir = "/opt/classification/results/")

# label the probability file (by default selecting the class with higher probability)
# apply a bayesian smoothing to remove outliers
label_cube <- sits_label_classification(probs_cube, 
                                        smoothing = "bayesian",
                                        output_dir = "/opt/classification/results/")
