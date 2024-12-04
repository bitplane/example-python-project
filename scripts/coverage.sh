#!/usr/bin/env bash

source .venv/bin/activate

pytest --cov="src/$1" --cov-report=html .
