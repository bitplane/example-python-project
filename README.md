# Example Python Project

This is how I like to lay my Python projects out. You don't have to do it
this way, but this way works for me. If you think it's bad or out of date
feel free to create an issue or even a pull request.

## To run me

    make dev

Then open the project dir in Visual Studio code, if you like to use an IDE.

## Project structure

### Makefile

I like to use a `Makefile` to install my dependencies, build env, run tests
and create packages. I get tab completion and it doesn't matter what CI
platform I use, I just run `make stuff` and let GNU Make deal with it.
`Makefile`s are of course an ancient curse, but if you don't use them you'll
have to live in interesting times, which is a far worse curse.

The trick is:

1. Have each step run one script that has a good name, so they're documented
   by that script and its name, and can be run without `make` - like from
   your editor or whatever. I keep mine in `./build-scripts/`.
2. Have the dependencies for the step be the script itself plus one file
   that it creates and anything that it depends on. So when you switch branch
   and the script or its inputs have changed, it'll blow the cache and re-run
   that step and all the ones after it.
3. If you don't know what the output file will be then just fake one. Like
   when installing `requirements-test.txt` I `touch ./venv/.test-dependencies`
   so it knows that step has been done and won't run it again.
4. Remember to remove those files in `clean.sh`. Remove everything in there.
5. Try to avoid use Make's advanced features. In a world where you can do
   anything, what you *don't* do is what defines you.

As a bonus, the file is self-documenting. Type `make help` to see what it can
do.

### Linting and commit checks

I like `flake8` for linting because it's not as harsh as `pylint`, and is
supported by my IDE of choice.

Part of the `make dev` setup installs `pre-commit`, which will make sure that
commits are up to a certain standard. The provided config file runs code
formatters, linters and a few other checks. Have a look at
`.pre-commit-config.yaml` to see what's going on in there.

### IDE

I'm using VS Code because it works everywhere and supports all the things that
I need. I commit my config to source control so anyone can open the project dir
and start hacking with a working debugger and the tests auto-detected.

The config also provides recommendations for extensions.

### Package layout

Under the `example_project` dir there's a `pyproject.toml` that defines the
project and its dependencies. Then there's `src` and `test` dirs that contain
the code and tests.

The layout is as-per the pypi packaging guidelines. When referencing stuff in
the code I tend to use the full `package.module` names because otherwise imports
tend to break in weird ways in different environments.

### Testing

I use `pytest` and write tests in a functional style, and develop using TDD.
If you get into the habit of actually running a new piece of code from a new
unit test then you'll find yourself writing testable code. Tests are
fundamentally just other pieces of code, so if a function is difficult to test
then it's probably difficult to reuse too.

Run `make coverage` for a test coverage report. I like to keep my coverage at
100%.

## Some opinionated stuff

### Megarepos

When working on microservices and with other teams I prefer a single mega repo
than lots of different ones if I can help it. Otherwise the style of things
will diverge, deps will change, things will get forgotten about and turn up
when you go to add something then add days of work, they'll be too difficult to
test. Keep everything together and you've got one source of the truth. Your
stubs, test data, functional and integration tests, infrastructure code,
architecture diagrams and specs - everything you need to actually understand
the project in one place.

## Docs in Markdown

Did you know that you can add a `README.md` to any dir and it'll get rendered
to HTML in most online viewers for git repos? Drop them in wherever you think
a directory/subtree needs an explanation for existing.

I think it's worth keeping most of the project documentation in Markdown as a
general rule, up to a point anyway. The project wiki is somewhere else, it goes
out of sync, it's difficult to see what the docs were on a specific release
tag. Docs in the codebase can be edited alongside new features and have a much
richer history.
