#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Standalone groan should run default command" && {

  context "when called without arguments" && {

    it "displaying 'Test successful message'" && (

      out=$(./groan)
      should_succeed

      expect $out to_be "Test successful: ()" 
    )
  }
 
  context "when called with -D debug flag" && {
  
    it "should display debug output" && {
    
       capture out <( ./groan -D test 2>&1 )
        
       $LOUD && printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Config? /*/groan.conf"
       expect_array out to_contain "Config? /*/.groan.conf"
       expect_array out to_contain "Config? /*/test_basic_script/groan.conf"
       expect_array out to_contain '*SCRIPT*groan*'
       expect_array out to_contain "Sub-command: 'test'"
       expect_array out to_contain "Looking for test\*.sub.\* in:*"     
    }
  }
}
