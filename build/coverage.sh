#!/usr/bin/env bash

source .venv/bin/activate

coverage run -m pytest ./*/tests
coverage html
