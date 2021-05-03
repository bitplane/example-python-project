#!/usr/bin/env bash

# activate venv
source .venv/bin/activate

# install our app
python3 -m pip install ./example_project

# let make know that we are installed in user mode
touch .venv/.installed
rm .venv/.installed-dev || true

