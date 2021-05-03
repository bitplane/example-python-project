#!/bin/bash

# create the python virtual environment
python3 -m venv venv

# activate it
source venv/bin/activate

# install test dependencies into it
python3 -m pip install -r example_project/requirements-test.txt

# let make know that we installed the dependencies
touch venv/.test-dependencies

