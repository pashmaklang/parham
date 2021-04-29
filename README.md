<div align="center">
  <img width="200" src="logo.svg" alt="Parham">
</div>

###### Logo by [Mehan](https://github.com/mehanalavimajd)

# Parham package manager
Parham is a package manager for [Pashmak programming language](https://github.com/pashmaklang).

With this package manager, you can manage libraries and for Pashmak projects and install/remove/update... them.

This project is licensed under the [GPL-v3](LICENSE).

## Get started
To run the Parham, enter this command:

```bash
$ pashmak src/parham/parham.pashm
# OR
$ ./src/parham/parham.pashm
```

### Installation
To install Parham on your system, run:

```bash
$ pashmak src/parham/parham.pashm install f:. --global
```

Now you can run Parham:

```bash
$ pashmak @parham ...
# OR on UNIX systems
$ parham ...
```

For updating the Parham, run:

```bash
$ parham install gh:pashmaklang/parham -g
```

## Documentation
Read the full documentation [here](doc).
