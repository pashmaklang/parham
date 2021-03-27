# Query system
With the query system, you can check installation of the packages.

An example query:

```
foo >= 1.0
```

The above query means `Is package foo installed version >= 1.0?`.

This syntax is used in `Parhamfile` for defining dependencies/conflicts for packages:

```
REQUIRE foo >= 1.0
REQUIRE ...
```

### Operators
- `>`: bigger
- `<`: less
- `>=`: bigger or equal
- `<=`: less or equal
- `=`: equal
- `!=`: not equal

You should use this sytnax:

```
<package-name> <operator> <version>
example:
foo = 1.0
```

### Without operator
You can check ONLY installation of the package. this means the installed verison is not important:

```
foo
```

The above query only checks foo is installed, version is not important.

### `|` (or)
We have the `|` (or) syntax. for example, your package require `foo` OR `bar`:

```
foo | bar
```

Also you can use operators inside each one:

```
foo <= 1.0 | bar > 9.3
```

### `&` (and)
The `and` syntax is like `or`:
This is useful to make conditional dependencies inside `or`:

```
foo | bar > 1.0 & baz
```

The above syntax is `foo OR (bar and baz)`.
