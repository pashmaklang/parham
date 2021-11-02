# Package Defination
For defining a package, you should create a file named `Parhamfile` in the root of your project.
There is a simple format for this file:

```
ATTRIBUTE <value>
```

like:

```
NAME unique-name-for-package

DESCRIPTION description of the package...
```

some of these attrubutes are single and some of them are list. for example `require` is a list:

```
REQUIRE a
REQUIRE b
REQUIRE c
...
```

You will get to know all of the properties in Parhamfile in this document:

- `name`: a unique name for the package (without whitespace)
- `description`: a short description for the package
- `description_file`: a file to load long description from that
- `author`: author of the package (we sugget this format: `fname lname email@example.com`)
- `license`: license of the project

There are other properties which need more explaination that you will learn about them in continue.

### `require` and `docflict`
This attribute determines the dependencies for the package.

```
REQUIRE gh:foo/bar >= 1.0
REQUIRE f:/foo/bar != 2.5.12
...
```

The format of the value of this property is explained in [query](query.md)

The `conflict` is exactly the same thing but this determines the packages which cannot be installed alongside this package.

### `path`: Path system
If someone install your package in their own project, they need to be able to import it in their project.
You should determine some "paths" for your package to tell Parham to load which files in the project.

If you package files are like this:

```
src/
    dir1/
        foo.pashm
    bar.pashm
```

and you add this in your Parhamfile:

```
PATH src
```

users of your package can import these parts like this:

```bash
import @dir1
import @bar
```

its a good thing to keep your directory structure like this:

```
src/
    your_project_name/
        other stuff...
```

then users will be able to import it like this:

```bash
import @your_project_name.somepart
```

Also you can add several paths:

```
PATH a
PATH b
...
```

### `script` and `default_script`: Script system
Package or Project authors can define some scripts in their Parhamfile to run some actions with a simple command.

```
SCRIPT build somewhere/build.pashm
SCRIPT test tests/run.pashm
...
```

then you can run them using:

```shell
$ parham run build
$ parham run test
...
```

Also you can use attribute `default_script` to set a script as default:

```
SCRIPT a a.pashm
SCRIPT b b.pashm

DEFAULT_SCRIPT b
```

then when you run:

```shell
$ parham run
```

its like you run:

```
$ parham run b
```
