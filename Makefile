environment:
	cd base \
	&& docker build -t "m3nin0/rep-lulc-version-base:latest" .

experiment_01:
	cd sits/30-06-2020 \
	&& ./run.sh \
	&& docker rm -f sits_classification_f0a9de020c2c4d2891523cd14ca452aac69790ae

experiment_02:
	cd sits/02-12-2020 \
	&& ./run.sh \
	&& docker rm -f sits_classification_13f6867b9e6b5f5e226ad5d97b93267fa8267d75

all: environment experiment_01 experiment_02
