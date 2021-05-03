#!/usr/bin/env bash

# activate venv
source .venv/bin/activate

# install our app
python3 -m pip install ./example_project[dev]

# let make know that we are installed in user mode
touch .venv/.installed-dev
rm .venv/.installed || true
