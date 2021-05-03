# Example python project

This is how I like to lay my python projects out. You don't have to do it
this way, but this way works for me.

# To run me

    make test

Then open the project dir in Visual Studio code, if you like to use an IDE.

# Project structure

## Makefile

I like to use a `Makefile` to install my dependencies and run my tests,
this way it doesn't matter what CI platform I use, I just run `make stuff`
in each step and let GNU Make deal with it. See the Makefile itself for

## Linter

I like `flake8` because it's not as harsh as `pylint`, and is supported
by my IDE of choice.

## IDE

I'm using VS Code because it works everywhere and supports all the things
that I need. I commit my config to source control so anyone can open the
project dir and start hacking.

## Package dirs

Under the `example_project` dir there's an `install.py` and the project
dependencies in the `requirements.txt` file. There's a `requirements-test.txt`
in there too for the test requirements. The `test` dir is for unit tests
and doesn't get installed with the program itself.

