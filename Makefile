test:
	docker build -t quasar-jupyter .
	docker run quasar-jupyter /bin/sh -c "nosetests /usr/local/lib/python2.7/dist-packages/pyquasar"
	docker run quasar-jupyter /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/*.ipynb"
	docker run quasar-jupyter /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/gas/*.ipynb"

test_hydro:
	docker run quasar-jupyter /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/hydro/*.ipynb"
