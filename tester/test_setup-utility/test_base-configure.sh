#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ../bash-spec-2/bash-spec.sh

#setup/reset
\rm ./base.conf
\rm ./base.conf.save

describe "Testing base setupconfigure- no configuration set" && {

  context "base setup configure --show" && {
    it "Displays 'no file found'" && {
      out=$(./base setup configure --show)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }
  
 context "base setup configure - default action is --show" && {
    it "Displays 'no file found'" && {
      out=$(./base setup configure)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }

  context "base setup configure --edit" && {
    it "Displays 'no file found'" && {
      out=$(./base setup configure --edit)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }

  context "base setup configure --options" && {
    it "Displays list" && {
      capture out <( ./base setup configure --options 2>&1 )
      should_succeed
 
      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "*test.conf (preset)"
      expect_array out not to_contain "*test2.conf"

    }
  }
  context "base setup configure --options from other context" && {
    it "Displays list" && {
      capture out <( cd other; ../base setup configure --options 2>&1 )
      should_succeed
 
      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "*1) local	\[ $DIR/other/base.conf \]"
      expect_array out to_contain "*2) user	\[ */.base.conf \]"
      expect_array out to_contain "*3) global	\[ $DIR/base.conf \]"

      expect_array out to_contain "*test.conf (preset)"
      expect_array out to_contain "*test2.conf"
    }
  }

  context "base setup configure blah - non existent file" && {
   
    it "Auto-appends .conf and reports not-found" && {
      out=$(./base setup configure blah)
      should_fail

      echo "[$out]"
      expect $out to_be "blah.conf not found" 
    }
  }

  context "base setup configure test" && {
   
    it "Auto-appends .conf and displays file contents" && {
       capture out <( ./base setup configure test 2>&1 )
        
       expect_array out to_contain "TEST=yes"
    }
  }
 
  context "base setup configure test --install=local" && {
   
    it "requests confirmation" && {
      capture out <( ./base setup configure test --install=local)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "cp test.conf $DIR/base.conf"
      expect_array out to_contain "dryrun:  --confirm required to proceed"
    }
  }

  context "base setup configure test --install=local --confirm" && {
   
    it "requests confirmation" && {
      capture out <( ./base setup configure test --install=local --confirm)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "cp test.conf $DIR/base.conf"
      expect_array out to_contain "test.conf installed as local configuration"
    }
  }

  context "base setup configure --show" && {
    it "Displays --local config found'" && {
      capture out <( ./base setup configure --show 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "*Option:*local*found:*$DIR/base.conf*"
      expect_array out to_contain "TEST=yes"
    }
  }
}

#setup/reset
\rm ./base.conf
\rm ./base.conf.save
