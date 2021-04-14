environment:
	cd base \
	&& docker build -t "m3nin0/rep-lulc-version-base:latest" .

experiment_01:
	cd sits/30-06-2020 \
	&& ./run.sh

experiment_02:
	cd sits/02-12-2020 \
	&& ./run.sh
