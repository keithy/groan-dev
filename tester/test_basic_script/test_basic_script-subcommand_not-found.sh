#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script" && {

  context "invalid sub-command " && {
    it "Displays not found message" && (
      out=$(./basic_script not-ever)
      should_fail

      echo "[$out]"
      expect "$out" to_match "Not Found: basic_script .*not-ever.*" 
    )
  }

  context "debug output" && {
    it "Displays debug output" && {
       capture out <( ./basic_script -D not-ever 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Config? /*/basic_script.conf.sh"
       expect_array out to_contain "Config? /*/.basic_script.conf.sh"
       expect_array out to_contain "Config? /*/test_basic_script/basic_script.conf.sh"
       expect_array out to_contain '*SCRIPT*basic_script*'
       expect_array out to_contain "Sub-command: 'not-ever'"
       expect_array out to_contain "Looking for not-ever\*.sub.\* in:*"     
    }
  }
}

