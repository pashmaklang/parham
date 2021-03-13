# Parham Commandline usage

General options:
- `--help`: shows help of a command
- `--version`: shows version of the Parham

## Command `show`
This command shows details of a package(s).
Here, we learn more about this command.

```bash
$ parham show [options...] [packages...]
# for example
$ parham show gh:foo/bar f:/path/to/foo/bar ...
```

#### Options
- `--versions`: shows list of versions of packages

## Command `install`
This command installs packages.

```bash
$ parham install [options...] package1 package2 ...
```

#### Options
> This command currently haven't any option

## Command `gen-loader`
This command generates script `pashmak_modules/load.pashm` for loading packages.

```bash
$ parham gen-loader [options...]
```

#### Options
> This command currently haven't any option

## Command `list`
This command shows list of installed packages.

```bash
$ parham list [options...]
```

Output is someting like this:

```
foo (1.0) - Description of the foo
bar (14.6.0) - Description of the bar
...
```
