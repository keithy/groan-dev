#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

#setup/reset
rm ./basic_script.conf.sh
rm ./basic_script.conf.sh.save

describe "Test groan base_script configure- no configuration set" && {

  context "base_script configure --show" && {
    it "Displays 'no file found'" && {
      out=$(./basic_script configure --show)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }
  
 context "base_script configure - default action is --show" && {
    it "Displays 'no file found'" && {
      out=$(./basic_script configure)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }

  context "base_script configure --edit" && {
    it "Displays 'no file found'" && {
      out=$(./basic_script configure --edit)
      should_fail

      echo "[$out]"
      expect $out to_be "No configuration file found" 
    }
  }

  context "base_script configure --options" && {
    it "Displays list" && {
      capture out <( ./basic_script configure --options 2>&1 )
      should_succeed
 
      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "*test.conf (preset)"
      expect_array out not to_contain "*test2.conf"

    }
  }
  context "base_script configure --options from other context" && {
    it "Displays list" && {
      capture out <( cd other; ../basic_script configure --options 2>&1 )
      should_succeed
 
      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "*1) --local	\[ */tester/test_basic_script/other/basic_script.conf.sh \]"
      expect_array out to_contain "*2) --user	\[ */.basic_script.conf.sh \]"
      expect_array out to_contain "*3) --global	\[ */tester/test_basic_script/basic_script.conf.sh \]"

      expect_array out to_contain "*test.conf (preset)"
      expect_array out to_contain "*test2.conf"
    }
  }

  context "base_script configure blah - non existent file" && {
   
    it "Auto-appends .conf and reports not-found" && {
      out=$(./basic_script configure blah)
      should_fail

      echo "[$out]"
      expect $out to_be "blah.conf not found" 
    }
  }

  context "base_script configure test" && {
   
    it "Auto-appends .conf and displays file contents" && {
       capture out <( ./basic_script configure test 2>&1 )
        
       expect_array out to_contain "TEST=yes"
    }
  }

  context "base_script configure test --install" && {
   
    it "requests destination location" && {
      out=$(./basic_script configure test --install)
      should_fail

      echo "[$out]"
      expect $out to_be "Provide an install location option for test.conf: (--local --user --global)" 
    }
  }
 
  context "base_script configure test --install --local" && {
   
    it "requests confirmation" && {
      capture out <( ./basic_script configure test --install --local)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "cp test.conf */tester/test_basic_script/basic_script.conf.sh"
      expect_array out to_contain "dryrun:  --confirm required to proceed"
    }
  }

  context "base_script configure test --install --local --confirm" && {
   
    it "requests confirmation" && {
      capture out <( ./basic_script configure test --install --local --confirm)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "cp test.conf */tester/test_basic_script/basic_script.conf.sh"
      expect_array out to_contain "test.conf installed as --local configuration"
    }
  }

  context "base_script configure --show" && {
    it "Displays --local config found'" && {
      capture out <( ./basic_script configure --show 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"

      expect_array out to_contain "--local config found: */tester/test_basic_script/basic_script.conf.sh"
      expect_array out to_contain "TEST=yes"
    }
  }
}

#setup/reset
rm ./basic_script.conf.sh
rm ./basic_script.conf.sh.save
