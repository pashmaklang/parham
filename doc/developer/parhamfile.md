# Parhamfile parser
The `Parhamfile`, is a file to define and config a package. this file is placed at root of the package repository.

Example of `Parhamfile`:

```
NAME a-unique-name-for-package

DESCRIPTION a short description for the package
DESCRIPTION_FILE README.md # set a file for long description

AUTHOR your name <yourmail@example.com>

LICEMSE GPL # or other licenses

REQUIRE gh:foo/bar
REQUIRE gh:vendor/package

CONFLICT gh:hello/world

# NOTE: the captalized keywords are not required. you can write for example `name` instead of `NAME`
# ...
```

Script `src/parham/pfile.pashm`, contains a class to parse the above syntax.

Class `ParhamFile`, has some static methods for paring this syntax.
Also, the output of the parsed file is a object from `ParhamFile` class.

## Parsing
To parse this file:

```bash
import_once 'src/parham/pfile.pashm'

$pfile = parham.ParhamFile->load_f('/path/to/Parhamfile')
$pfile = parham.ParhamFile->loads('<content of file as string>')
```

## Attributes

```bash
$pfile->name                # string
$pfile->description         # string
$pfile->description_file    # string
$pfile->author              # string
$pfile->license             # string
$pfile->require             # list (like ['vendor1/package1', 'foo/bar'])
$pfile->conflict            # list

$pfile->raw_options         # dict
# example
$pfile->raw_options['name']
```
