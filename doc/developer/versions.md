# Version parser
Parham has a version parser in `parham/version.pashm` to parse and compare version numbers.

## `parham.version.compare($a, $b)`
This function compares two versions:

```bash
println parham.version.compare('2.0', '1.0') # `1`
println parham.version.compare('2.0', '4.0') # `-1`
println parham.version.compare('3.1', '3.1') # `0`
```

This function returns `1` if a is bigger than b, `-1` if a is less than b and `0` if both version equal.

## `parham.version.try_parse_int($str)`
This function parses a int from string but ignores non-numeric chars and parses without error.

```bash
parham.version.try_parse_int('12f45') # 1245
parham.version.try_parse_int('hello') # 0
parham.version.try_parse_int('hello1a2') # 12
```

## `parham.version.parse($str)`
This function parses a version string and returns a array from numbers.

```bash
parham.version.parse('1.5.29-a1') # [1, 5, 29, -1, 971]
```
