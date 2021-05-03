#!/bin/bash

# create the python virtual environment
python3 -m venv venv

# activate it
source venv/bin/activate

# install dependencies into it
python3 -m pip install -r example_project/requirements.txt

# install the project itself
python3 -m pip install -e example_project

