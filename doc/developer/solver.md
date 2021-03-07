# Dependency/Conflict solver
This system is a class in `src/parham/solver.pashm`.

each package may has some dependencies and some conflicts.

This system solves them.

```bash
$solver = parham.DependencySolver()

# ...

$i = 0
while $i < len($packages)
    $solver->install($packages[$i])

    if $solver->error is not null
        println 'Error: ' + $solver->error
        break
    endif

    $i = $i + 1
endwhile

# ...

```

the passed object to `$solver->install` should be a `parham.Package`.
