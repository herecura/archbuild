BlackEagle's Archlinux Build stuff
==================================

## Repo Layout
******

${repo}-staging -> ${repo}-testing -> ${repo}

## Building packages
******

`buildone` will build a package for all its defined architectures for the
currently checked out branch in the package's git tree.

for example:

- package foo
- git repo of foo is checked on branch 'herecura-testing'
- buildone will build for repo herecura-testing
- the helper herecura-testing-${arch}-build will be called (devtools)
- if the build is successfull and there were uncommited changes they will be
  commited in the current branch

## Package management
******

### update in repository

After a package is successfully built, update it in the repo's

### move from/to repoistory

Move a package from one repo to another.

a move can be:
- ${repo}-staging -> ${repo}-testing
- ${repo}-staging -> ${repo}
- ${repo}-testing -> ${repo}

In the git tree, the originating branch will be merged into the target branch
and the originating branch will be removed.  When the move is ${repo}-staging
-> ${repo} there will be an additional check if there is a -testing package and
or branch.

### remove from repository

The package(s) will be removed from the repositories, and in git the ${repo}
branch will be renamed to 'deleted'.

## Dependencies
******

- devtools
- pkgbuild-introspection
