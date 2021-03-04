# Package model
This section of program handles package data layer.
This is at `src/parham/package.pashm`.

## Class `Package`

```bash
$pkg = parham.Package('f:/path/to/package/dir')
$pkg = parham.Package('gh:user/repo')
```

### Drivers
Currently, we have 2 drivers: `f` and `gh`.

Structure of package name: `<driver>:<address>`.

`f` means a local directory.
`gh` means a github repository.

Driver of `f` is `parham.FileDriver` and `gh` is `parham.GithubDriver`.

### Error handling
If you create a `Package` object, if there was a error, this error will be stored in `$pkg->error`.

```bash
$pkg = parham.Package('f:/path/to/package/dir')

if $pkg->is_success()
    # package is valid and loaded successfully
    # ...
else
    # there is some errors
    println $pkg->error # print the error
endif
```

Usual errors for `f` driver:
- `not found`: directory not found
- `not a Git reposotory`: the directory is not a git repository (haven't `.git/`)
- `faild to load list of versions: <error>`: error while loading list of package versions

### `$pkg->versions`
This attribute contains list of versions (git tags).

### `$pkg->get_version($version)`
This method loads `Parhamfile` config of a specify version in a package.

```bash
# Example
println 'Descripion: ' + $pkg->get_version('1.0')->description
```
