test:
	docker build -t quantego/quasar .
	docker run quantego/quasar /bin/sh -c "nosetests /usr/local/lib/python2.7/dist-packages/pyquasar"
	docker run quantego/quasar /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/*.ipynb"
	docker run quantego/quasar /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/gas/*.ipynb"

test_hydro:
	docker run quantego/quasar /bin/sh -c "/usr/local/bin/jupyter nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/hydro/*.ipynb"
