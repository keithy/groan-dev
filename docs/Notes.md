### All top-level commands are implemented by the same script

`groan` uses very few scripts to implement all of its features, for example all top-level "commands"
are exactly the same script but with differing names. 
i.e `rename-to-your-command-name` and `groan\groan` are identical.

When developing groan, the utility `hardlink -c .` is useful, creating hardlinks between all content-identical
files in the code-base. (on OSX: `brew install hardlink`)

