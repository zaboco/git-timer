# git-timer
> _Commit until the time is up... or start over!_

__git-timer__ is a `node.js` CLI application written in [LiveScript](http://livescript.net) that forces you to commit before a timer is up. It can be used for learning purposes (e.g. for a [Code Retreat](http://coderetreat.org/profiles/blogs/new-session-idea-baby-steps)), or just for regular use, to keep a good commit pace.

## Installation
```sh
$ npm install -g git-timer
```

## How it works
When you run it, it starts a countdown timer. You are suppose to write code and commit before the time is up. If you don't commit, the repository is reset (using `git reset --hard`) and the timer starts over. Else, if you commit before timeout, the timer simply resets, and you can move on to the next commit.

### Advanced usage - commit only on <span style="color:green">green</span>
To make things more challenging, you can add another rule to the game, by only allowing yourself to commit when all tests pass. You can enforce that by adding a [pre-commit hook](http://git-scm.com/book/en/Customizing-Git-Git-Hooks) that will run your test suite before commiting.

> If you are developing a `node.js` project and define `npm test` (in `package.json`), you just have to run `git-timer -g` (see section __Options__ below for details).

## Options
```sh
$ git-timer -h

Usage: git-timer [options]

Options:
    -h, --help          output usage information
    -V, --version       output the version number
    -m, --minutes [min] specify timeout in minutes (default is 5)
    -g, --green         Allow only commits on green.
                        (!) node only - requires `npm test` to be defined.
                        (!) WARNING: adds a pre-commit hook to git
```

* `--minutes` allows you to override the default timeout (5 minutes)
* `--green` enforces commits only on green, assuming `npm test` is available. It basically creates a pre-commit script so that commits are allowed only if `npm test` passes.
    <i>__Notes__
    - It only works if you don't already use a pre-commit hook.
    - It can be reverted by `rm .git/hooks/pre-commit`
    - If you use another language, you can still use this, just replace `npm test` with the test command, inside the generated pre-commit script</i>
