# boilerplate-bash

> Boilerplate for creating simple bash scripts with basic strictness
> checks, help features, debug printing and basic option handling.

## Usage:
```
$ boilerplate-bash [--option <argument>]
```
### Options

##### `-h`, `--help`

Display help information.

##### `-x`, `--option-x`

An option named 'x'.

##### `-o`

Short option with argument.

##### `--long-option-with-argument`

Long option with argument.

##### `--debug`

Display debug information.

### Testing

This boilerplate uses [Bats](https://github.com/sstephenson/bats)
(Bash Automated Testing System) for testing. The Bats testing file for this
boilerplate can be found in the '/test' directory.

#### Usage

```
$ bats test/boilerplate-bash.bats
```

### Linting

For linting boilerplate-bash uses ShellCheck.

- [ShellCheck](http://www.shellcheck.net)

## Features

- Strict Mode,
- Help template, printable with `-h` or `--help`,
- `debug` printing with `--debug` flag,
- `die` command with error message printing and exiting,
- Option normalization (eg, `-ab -c` -> `-a -b -c`) and option parsing.

## Design rules

- Use leading underscores on internal variable and function names in order
  to avoid name collisions. For unintentionally global variables defined
  without `local`, such as those defined outside of a function or
  automatically through a `for` loop, prefix with double underscores.
- Always use braces when referencing variables, preferring `${NAME}` instead
  of `$NAME`. Braces are only required for variable references in some cases,
  but the cognitive overhead involved in keeping track of which cases require
  braces can be reduced by simply always using them.
- Prefer `printf` over `echo`. For more information, see:
  http://unix.stackexchange.com/a/65819
- Prefer `$_explicit_variable_name` over names like `$var`.
- Use the `#!/usr/bin/env bash` shebang in order to run the preferred
  Bash version rather than hard-coding a `bash` executable path.
- Prefer splitting statements across multiple lines rather than writing
  one-liners.
- Group related code into sections with large, easily scannable headers.

## Related

### Original work

This boilerplate is a modified version of a script from
[alphabetum/bash-boilerplate](https://github.com/alphabetum/bash-boilerplate).
Please reference this project, and specifically,
the script [bash-simple-plus]
(https://github.com/alphabetum/bash-boilerplate/blob/master/bash-simple-plus)
for more detailed information about the workings of this boilerplate. In this
boilerplate most of the elaborate commented information is removed from the
code.

### Related projects

After thoroughly researching and testing many different Bash boilerplates and
resources I've found the work of [alphabetum](https://github.com/alphabetum)
to be the most complete, strict and flexible out there.

- [kvz/bash3boilerplate](https://github.com/kvz/bash3boilerplate) Another
quality Bash framework compatible with Syslog Severity levels
- [connermcd/bash-boilerplate](https://github.com/connermcd/bash-boilerplate)
A super minimal Bash boilerplate

## License

MIT © [Bram Kok](https://bramkok.com)
