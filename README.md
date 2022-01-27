# pyenv-alias-latest-patch-version
[pyenv](https://github.com/pyenv/pyenv) plugin to facilitate 'major.minor' `.python-version` values that map to the latest patch versions.

This plugin allows you to specify `Major.minor` versions, without the patch version, so that projects that make use of `.python-version` are not
pinned/locked to a specific patch version.  This in turn eliminates the need for multiple developer, CI/CD, and
deployment systems from having to use specific `Major.minor.patch` versions.

With `.python-version` declared in this way, you are saying "use the latest available patch version for this Major.minor
Python version"

CI/CD systems can then be independently updated with the latest Python patch version without having to make the corresponding update to
`.python-version` in the source code repository.

## Installation
```
git clone https://github.com/upside-services/pyenv-alias-latest-patch-version.git $(pyenv root)/plugins/pyenv-alias-latest-patch-version
```

## Usage
The plugin works in conjunction with the `pyenv install Major.minor:latest` operation.
Whenever you subsequently install a Python version using the `:latest` option, this plugin will create a symbolic link
that points to the installed `Major.minor.path` version.

Example:
```
$ pyenv install 3.9:latest
    Downloading Python-3.9.10.tar.xz...
    -> https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tar.xz
    Installing Python-3.9.10...
    Installed Python-3.9.10 to /home/brandon/.pyenv/versions/3.9.10

    Setting alias '3.9' for '/home/brandon/.pyenv/versions/3.9.10'

$ pyenv versions
    * system (set by /home/user/.pyenv/version)
    3.9
    3.9.10

$ pyenv local 3.9
$ python --version
    Python 3.9.10

$ cat .python-version
    3.9
```