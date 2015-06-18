# Quantego QUASAR

[QUASAR](http://static.quantego.com/QUASAR.pdf) is an analytics software that empowers decision-makers to optimize models with random parameters. The easiest way to get started using our powerful stochastic optimizer. Model, optimize and analyze your decisions directly in iPython. Includes many examples and a full QUASAR version, limited to 50 nodes and 24 stages.

## Examples

![Hydro storage](http://static.quantego.com/example-hydro.png)

Easily model and optimize complex decision problems involving uncertainty in iPython:

- [Newsvendor problem (Intro)](https://github.com/quantego/quasar-samples/blob/master/Newsvendor.ipynb)
- [Inventory Managment](https://github.com/quantego/quasar-samples/blob/master/AggregatePlanning.ipynb)
- [Hydro dam storage](https://github.com/quantego/quasar-samples/blob/master/SimplyHydroExample.ipynb)
- [Household-size battery store](https://github.com/quantego/quasar-samples/blob/master/BatteryStorage.ipynb)

## Get started

- Install [Docker](https://docs.docker.com/installation/#installation) or [Kitematic](http://www.kitematic.com) on Mac OSX.
- run `docker run -p 8888:8888 quantego/quasar` or search Kitematic for `quantego/quasar`
- open [http://localhost:8888](http://localhost:8888)

## Documentation

The best way to learn is from the included example notebooks.

For more tutorials and a command reference, please refer to [http://docs.quantego.com/pyquasar/](http://docs.quantego.com/pyquasar/)

## Support and Commercial Use

Quantego QUASAR is a commercial library, designed to run on top of the excellent Jupyter platform. You can test QUASAR as long as you want. We also include a trial license for a commercial [LP solver](http://www.sulumoptimization.com) we're using. CLP via Google's ORTools is included as well.

If you wish to use Quantego QUASAR in a commercial environment or remove the variable- and stage restrictions for academic use, please contact us at [info@quantego.com](mailto:info@quantego).
