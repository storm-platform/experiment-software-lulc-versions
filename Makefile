environment:
	cd base \
	&& docker build -t "m3nin0/rep-lulc-version-base:latest" .

experiment_01:
	cd sits/30-06-2020 \
	&& ./run.sh

experiment_02:
	cd sits/02-12-2020 \
	&& ./run.sh

experiment: environment experiment_01 experiment_02

# Validation section
validation_build:
	docker build -t "experiment_software_version:temp" -f verification/Dockerfile .

validation_raster_diff: validation_build
	docker run -ti -d --name experiment_software_raster_diff -v ${PWD}:/opt/experiment/ \
	experiment_software_version:temp python verification/difference_raster.py \

validation_diff_plot: validation_build
	docker run -ti -d --name experiment_software_raster_diff_plot -v ${PWD}:/opt/experiment/ \
		experiment_software_version:temp python verification/difference_plot.py

validation: validation_raster_diff validation_diff_plot

clean:
	docker rm -f sits_classification_f0a9de020c2c4d2891523cd14ca452aac69790ae
	docker rm -f sits_classification_13f6867b9e6b5f5e226ad5d97b93267fa8267d75
	docker rm -f experiment_software_raster_diff
	docker rm -f experiment_software_raster_diff_plot
