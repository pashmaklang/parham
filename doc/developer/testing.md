# Testing
This is a guide for testing system for this project.

## Running the tests
To run the Parham tests:

```bash
$ make test
# OR
$ pashmak tests/run.pashm
# OR
$ ./tests/run.pashm
```

To run a specify test:

```bash
$ pashmak tests/test_parhamfile.pashm # or other test script
```

## Creating the tests
A Basic template for the test files.
Any pashmak script with `.pashm` extension in the `tests` folder will be considered as test script.

For example `tests/test_my_simple_test.pashm`:

```bash
# imports
import_once @test
import_once $__dir__ + `/../src/parham/<something-in-parham>...`

@doc "A Human readable caption for the test (will be showed by `tests/run.pashm`)"
func test_my_simple_test()
    assert 1 == 1
    test.assertEquals(1, 1)
endfunc

# register the test function
redefine('TEST', test_my_simple_test)

# handle single test run
if $__ismain__
    TEST()
endif
```
