#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script (symlinked)" && {

  context "symlinked_script test" && {
    it "Displays 'Test successful message'" && {
      out=$(./symlinked_script test)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: ()" 
    }
  }

  context "symlinked_script test --debug output" && {
    it "Displays debug output" && {
       capture out <( ./symlinked_script -D test 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Config? /*/basic_script.conf.sh"
       expect_array out to_contain "Config? /*/.basic_script.conf.sh"
       expect_array out to_contain "Config? /*/test_basic_script/basic_script.conf.sh"
       expect_array out to_contain '*SCRIPT*basic_script*'
       expect_array out to_contain "Sub-command: 'test'"
       expect_array out to_contain "Looking for test\*.sub.\* in:*"     
    }
  }

  context "symlinked_script test that args get through" && {
    it "Displays 'Test successful message'" && {
      out=$(./symlinked_script test this --or that --please)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: (this --or that --please)" 
    }
  }
}
