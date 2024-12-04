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
   your editor or whatever. I keep mine in `./scripts/`. The reason for having
   them as separate scripts is because you might want to bypass dependencies
   in a CI pipeline.
2. Have the dependencies for the step be the script itself plus one file
   that it creates and anything that it depends on. So when you switch branch
   and the script or its inputs have changed, it'll blow the cache and re-run
   that step after all the ones that depend on it.
3. If you don't know what the output file will be then just fake one. Like
   when installing the packages I `touch ./venv/.installed` so it knows that
   step has been done and won't run it again.
4. Remember to remove those files in `clean.sh`. Remove everything in there.
5. Try to avoid use Make's advanced features. In a world where you can do
   anything, what you *don't* do is what defines you.

As a bonus, the file is self-documenting. Type `make help` to see what it can
do.

### Linting and commit checks

I like `flake8` for linting because it's not as harsh as `pylint`, and is
supported by my IDE of choice.

Part of the `make dev` setup installs `pre-commit`, which will make sure that
commits are up to a certain standard. The provided config file runs the code
formatters, linters and a few other checks. Have a look at
`.pre-commit-config.yaml` to see what's going on in there. pre-commit is very
slow and very annoying, but it forces code quality on us which makes up for the
inconvenience.

See the `.flake8` config for some ignored rules where flake8 and black get into
a fight, and there's `isort` and `black` conflict rules in the pre-commit
config too.

### IDE

I'm using VS Code because it works everywhere and supports all the things that
I need. I commit my config to source control so anyone can open the project dir
and start hacking with a working debugger and the tests auto-detected. This is
a nice new paradigm where the IDE settings don't belong to the user, they
belong to the project, so it's appropriate to put them in source control.

The config also provides recommendations for extensions, which you'll be
prompted to install when you open the project for the first time.

I could (and sometimes do) go one step further and use devcontainers, but at
time of writing it's still a bit fiddly to get set up.

### Package layout

Under the `example_package` dir there's a `pyproject.toml` that defines the
package and its dependencies. Then there's `src` and `test` dirs that contain
the code and tests.

The layout is as-per the pypi packaging guidelines. When referencing stuff in
the code I tend to use the full `package.module` names because otherwise imports
tend to break in weird ways in different environments, and it means I can
reference stuff in parent directories without ripping my hair out. It makes the
imports look a bit Java-y but it's staying that way until implicit imports are
removed from Python.

### Testing

I use `pytest` and write tests in a functional style, and develop largely using
TDD. If you get into the habit of actually running a new piece of code from a
new unit test then you'll find yourself writing testable code. Tests are
fundamentally just other pieces of code, so if a function is difficult to test
then it's probably difficult to reuse too. But it doesn't work all the time;
testing filesystem interactions and external services have a heavy
test-development overhead, which hinders rather than helps refactoring efforts;
your mileage may vary.

Run `make coverage` for a test coverage report.

### CI and CD

There's a couple of workflows in the `.github` dir, one to run the unit tests
and one to release the project to pypi. The first

The release process runs whenever you
push tag changes to GitHub.

Before the release process will work you
need to get a key from pypi and add

there's a couple of workflows, one that runs the
`make test` any time a commit is pushed. This

### Documentation

You'll see a `mkdocs` config in the root. This is combined with the `make docs`
script to make the github pages documentation for the project. If you look at
this README.md file you'll see it's actually a symlink to the one in the package
dir, and it's also symlinked from

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
