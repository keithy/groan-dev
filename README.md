[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)
[![Build Status](https://travis-ci.com/keithy/groan-dev.svg?branch=master)](https://travis-ci.com/keithy/groan-dev)
[![GitHub issues](https://img.shields.io/github/issues/keithy/groan-dev.svg)](https://github.com/keithy/groan-dev/issues)

## `groan`-dev

The `groan` framework is the basis for building complex hierarchical CLI interfaces, 
and aspires to achieve this with some degree of efficiency and elegance, 
through hierarchical composition.

The `groan-dev` project provides comprehensive testing tooling and specs for `groan`.
This provides testing and facilitates debugging of features such as command **composition** which
may be tricky to implement.

## Use hardlinks

When developing it is recommended to use hardlinks, so that all identical files have one and the same source.
Since this is invisible to `git`, the hardlinks need to be setup manually using. 
 
```
hardlink -c .
```

(on OSX hardlink can be installed with brew)