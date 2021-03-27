# Parham Command Line Parser
The Parham command line layer is handled by `src/parham/cmdline.pashm` script.
There is some APIs for parsing and validating the command line arguments.

## `cmdline.parse_args()`: Parsing the arguments
Function `parham.cmdline.parse_args` gets the command line arguments as a list and parses them.

For example:

```bash
import_once 'src/parham/cmdline.pashm'

$args = parham.cmdline.parse_args($argv[1:])
```

The output is a `parham.cmdline.ParsedArgs` object. This object contains the parsed arguments,
and has some methods for working with them.

```bash
$args = parham.cmdline.parse_args($argv[1:])

println $args->has_option('--something') # True/False
```

The `has_option` method gets option name and returns a boolean that is this option inserted or not.

Also there is other method named `get_option_value` that returns parameter of a option:

```bash
println $args->get_option_value('--name')
```

In the above example, if you pass `--name=something` to your app, `something` will be returned:

```bash
$ pashmak myapp.pashm foo bar --name=parsa
```

### Validation
The `ParsedArgs` object can validate the inserted options.

This is the next step after parsing options. now, its time to validate arguments.

```bash
$args->validate({
    'options': {
        '--name': {
            'required': true,
            'value_required': true
        }
    }
})
```

Like the above example, you should call method `validate` and pass a `dict` to that. in this dictionary,
key `options` configures the options.

You should write something like this:

```json
{
    "options": {
        "--option-name": {
            // ...
        },

        "-x": {
            // ...
        }
    }
}
```

For each option, you can set this fields:

- `required`: a boolean that determines is this option required or not
- `value_required`: determines is this option requires a value (a parameter)
- `default_value`: if not value is passed for this option, you can set default value

Example:

```bash
$result = $args->validate({
    'options': {
        '--name': {
            'required': true,
            'value_required': true,
            'default_value': 'foo',
        }
    }
})
```

But what is the result of the validation? the `validate` method returns a output.

If validation is successful, returned value is `true`.

But if there was some errors, a string will be returned that is the error message.

For example:

```bash
$result = $args->validate({
    'options': {
        '--name': {
            'required': true,
            'value_required': true,
            'default_value': 'foo',
        }
    }
})

if $result is true
    # everything is ok...
else
    # print the error message
    perror $result
endif
```

Also you can validate maximum and minimum count of arguments:

```bash
$args->validate({
    'min_args': 1,
    'max_args': 2,
})
```

if you set the above fields on `null` or don't set them, argument count will be ignored.

## Command handling
Parham has some subcommands like `list`, `install`, etc.

They are stored at `src/parham/commands/`.

This script has a variable named `$parham.commands.list`. This is a `dict`.

For example:

```bash
$list = {
    "list": list_cmd,
    "install": install_cmd,
    # ...
}
```

Command name is the key and command function is the value of the key. you should put a function in the items.

If the subcommand is inserted, that function will be run and `ParsedArgs` object will be passed to that.

Also the default command is `index`. means if user don't write subcommand, command `index` will be run.

## Printing (Logging)
There is a script named `src/parham/log.pashm`. This is a script for handling printing.

We have 4 levels of print:
- `info`: The unnecessary texts
- `info`: Normal print
- `warn`: Warnings
- `err`: Errors

Look at this example:

```bash
import_once 'src/parham/log.pashm'

parham.print_info('something')
parham.print_log('something')
parham.print_warn('something')
parham.print_err('something')
```

For disabling each one of the levels, you should set this names:

```bash
define('PARHAM_LOG_INFO', false)
define('PARHAM_LOG_LOG', true)
define('PARHAM_LOG_WARN', false)
define('PARHAM_LOG_ERR', true)
```

Also user can disable the log levels by using this options:
- `-q` to disable `info`
- `-qq` to disable `info` and `log`
- `-qqq` to disable `info`, `log` and `warn`
- `-qqqq` to disable `info`, `log`, `warn` and `err`
