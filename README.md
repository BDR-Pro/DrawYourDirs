# drawyourdir 🌳

Draw a pretty tree of your directory structure with `drawyourdir`! This Python script prints a directory tree, respecting `.gitignore`, ignoring hidden files (if specified), ordering files by their size within directories, and limiting the number of files listed.

## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/bdr-pro/drawyourdir.git
cd drawyourdir
```

### linux / macOS

To install, run:

```bash
./install.sh
```

Make sure `install.sh` is executable:

```bash
chmod +x install.sh
```

### Windows

To install in powershell admin, run:

```bash

.\install.ps1

```

## Usage

To draw the directory structure, navigate to your desired directory and run:

```bash
drawyourdir <args>
```

Where `<args>` can include:

- `-p` or `--path`: Specify the directory path (default is the current directory).
- `-l` or `--levels`: Define the maximum directory depth to display (default is 4).
- `-i` or `--ignore`: Ignore files starting with a dot (hidden files).
- `-g` or `--git`: Respect `.gitignore` file and ignore files specified within.
- `-f` or `--files`: Limit the maximum number of files to list per directory, ordered by size.

### Example

```bash
drawyourdir -p C:\Users\YourName\Documents\Project -f 3 -i
```

This command will print the directory tree for `Project`, listing up to 3 files per directory by size and ignoring hidden files.

## Result Example

```bash
prime/
|-- prime_linux (3.73 MB)
|-- prime.exe (245.99 KB)
|-- README.md (2.37 KB)
|-- #####
src/
|-- main.rs (0.98 KB)
target/
|-- CACHEDIR.TAG (177 B)
debug/
    |-- prime.pdb (2.47 MB)
    |-- prime.exe (361.50 KB)
    |-- prime.d (0.12 KB)
    |-- #####
build/
    num-bigint-180e83325ed2829c/
        |-- output (0.11 KB)
        |-- root-output (0.09 KB)
        |-- invoked.timestamp (0.05 KB)
        |-- #####
    num-bigint-b4afae5dfafc2711/
        |-- build_script_build-b4afae5dfafc2711.pdb (1.58 MB)
        |-- build_script_build.pdb (1.58 MB)
        |-- build-script-build.exe (348.99 KB)
        |-- #####
    num-traits-4e17e6738bcb6d2e/
        |-- build_script_build-4e17e6738bcb6d2e.pdb (1.57 MB)
        |-- build_script_build.pdb (1.57 MB)
        |-- build-script-build.exe (329.60 KB)
        |-- #####
    num-traits-59db63a5c24b3c3c/
        |-- output (0.34 KB)
        |-- root-output (0.09 KB)
        |-- invoked.timestamp (0.05 KB)
        |-- #####
    windows_x86_64_msvc-866c1eb008cfce0f/
        |-- output (0.13 KB)
        |-- root-output (0.10 KB)
        |-- invoked.timestamp (0.05 KB)
        |-- #####
    windows_x86_64_msvc-cfe3575fc0198c88/
        |-- build_script_build-cfe3575fc0198c88.pdb (1.30 MB)
        |-- build_script_build.pdb (1.30 MB)
        |-- build-script-build.exe (156.91 KB)
        |-- #####
deps/
    |-- libclap_builder-3599b7507a581807.rlib (23.12 MB)
    |-- libnum_bigint-4ddc0cff25ad5779.rlib (4.63 MB)
    |-- libwindows_sys-27ee461ddd1810f9.rlib (3.25 MB)
    |-- #####
...

```

## License

`drawyourdir` is open-sourced software licensed under the [MIT license](LICENSE).

---
