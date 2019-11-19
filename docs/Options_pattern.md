# groan options pattern

`groan` uses a pattern for processing command line options that works very well.
Custom sub-commands can adopt a similar approach by borrowing code from examples in the codebase.

### The general pattern

`set -o allexport` ensures that all variables are automatically exported to sub-commands.

All of the variables that are to be set by options are given their initial values. 
```
#default flags

DEBUG=false
LOUD=true
THEME=default
```

Options are processed by a loop surrounding a case statement.
Below you see that multiple matches can be provided for each case, 
and the value of the named parameter `theme` is easily extracted.
```
args=()
 
for arg in "$@"
do
    case "$arg" in
      --debug | -d | -D)
            DEBUG=true           
            LOUD=true
      ;;
      --quiet | -q)
            LOUD=false
            DEBUG=false
      ;;
      --theme=*)
            THEME=${arg##--theme=}
      ;;
      --*)
          args+=($arg)
      ;;
      *)
          if [[ "$c_sub_cmd" = "" ]]; then
             c_sub_cmd=$arg
          else
             args+=($arg)
          fi
      ;;
    esac
done
```
After the options for this script have been read into their variables, the remaining options and arguments 
are collected in the `$args` array to be passed on to the sub-command. 
Note how the first unprocessed argument is used as the sub-command name.

### Additional elements

If an option wants the value of the next parameter, this is the pattern we use.
In the `case` statement the option sets the `GETEXEC` variable to true. On the following iteration
the `if $GETEXEC` collects the next parameter whatever it is.
```
GETEXEC=false
what="env"
for arg in "$@"  
do
    if $GETEXEC; then
        what=$arg
        GETEXEC=false
        continue
    fi

    case $arg in
    --eval | -e)
        GETEXEC=true
    ;;
    esac
done
```
This alternative arrangement gets the next non-option parameter.
```
GETEXEC=false
what="env"
for arg in "$@"  
do
    case $arg in
    --eval | -e)
        GETEXEC=true
    ;;
    --*)  
    ;;
    *)
      if $GETEXEC; then
        what=$arg
        GETEXEC=false
        continue
      fi
    ;;
    esac
done
```

### Miscellaneous

For case-insensitive matching of options the following command is available in `bash`. 
This affects `case`, `==` and `~=`.
`shopt -s nocasematch`