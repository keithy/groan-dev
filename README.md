[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)
[![Build Status](https://travis-ci.com/keithy/groan-dev.svg?branch=master)](https://travis-ci.com/keithy/groan-dev)
[![GitHub issues](https://img.shields.io/github/issues/keithy/groan-dev.svg)](https://github.com/keithy/groan-dev/issues)

## `groan`-dev

The `groan` framework is a basis for building complex hierarchical CLI interfaces with bash and other languages, 
and aspires to achieve this with some degree of elegance, through hierarchical composition.

The `groan-dev` project provides comprehensive testing tooling and specs for `groan`.
This facilitates debugging of features such as command **composition** which
may be tricky to implement correctly.

## git Sub-modules

`groan` is included as a sub-module of `groan-dev` so tat the two may be developed in parallel.

## Use hardlinks

When developing it is recommended to use hardlinks, so that all identical files have one and the same source.
Since this is invisible to `git`, the hardlinks need to be setup manually using. 
 
```
hardlink -cv .
```

(on OSX hardlink can be installed with brew)

