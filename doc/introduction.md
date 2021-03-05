# Introduction to the Parham package manager
Parham can load packages in two types: local git directories and github repositories.

All the Parham packages are based on the git repositories. this repos can be local and can be on github.

Naming structure of packages is something like this:

```
<driver>:<name>
f:/path/to/local/directory
gh:user/repo
```

You can see information of the packages using `show` command:

```bash
$ parham show gh:foo/bar
Name: ...
Description: ...
...
```

Also you can specify version of the packages:

```bash
$ parham show gh:foo/bar=1.9
```

Parham uses **Git tags** as versions. means, if you want to handle versions of your package,
you don't need to upload or publish new versions anywhere. you only need to set a git tag on your repo.

Also Parham haven't any official server for indexing packages. because this Package manager
uses github repos and package maintainers not need to publish the packages anywhere.

## Basic package defination
If you want to define a basic package, you should create a file named `Parhamfile` in root of
you git repository and put this content for a basic configuration:

```
NAME a-unique-name
DESCRIPTION this is a test package
```

(You will learn about other configuration options for `Parhamfile` in next parts).

then, you need to publish your package on a github repo. also users can
install this package by using a local git directory:

```bash
$ parham show gh:your-name/your-repo
$ parham show f:/path/to/your-package
```

---

[Next: Shwoing package details](show-command.md)
