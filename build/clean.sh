#!/usr/bin/env bash

rm -r .venv
rm .coverage
rm -r htmlcov
rm .git/hooks/pre-commit
find . -name '__pycache__' -delete
find . -name '*.egg-info' -delete
find . -name '.pytest_cache' -delete

echo Cleaned project
