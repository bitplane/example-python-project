
.PHONY: all clean test dev \
	test-example_project

all: venv/bin/activate test

test: venv/bin/activate test-example_project

test-example_project: venv/bin/activate venv/.test-dependencies
	build-scripts/test.sh

clean:
	./build-scripts/clean.sh

linter: ./venv/bin/activate
	./build-scripts/linter.sh

venv/bin/activate: example_project/requirements.txt build-scripts/venv.sh
	build-scripts/venv.sh

venv/.test-dependencies: example_project/requirements-test.txt venv/bin/activate 
	build-scripts/venv-test.sh

venv/bin/activate: example_project/requirements.txt example_project/requirements-test.txt
	build-scripts/venv.sh

