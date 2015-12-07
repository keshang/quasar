test:
	docker build -t quasar .
	docker run quasar /bin/sh -c "/usr/bin/python -c 'import pyquasar.tests; pyquasar.tests.run()'"
	docker run quasar /bin/sh -c "/usr/local/bin/ipython nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/*.ipynb"
	docker run quasar /bin/sh -c "/usr/local/bin/ipython nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/gas/*.ipynb"

test_hydro:
	docker run quasar /bin/sh -c "/usr/local/bin/ipython nbconvert --to=html --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=3600 samples/hydro/*.ipynb"
