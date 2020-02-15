#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Subcommands - should work as advertised" && {

  context "when invoked without arguments" && {
  
    it "groan test - should display 'Test successful message'" && {

      out=$(./groan test)
      should_succeed

      expect $out to_be "Test successful: ()" 
    }

    it "groan test -D - should display debug output" && {
    
       capture out <( ./groansalot_symlink -D test 2>&1 )
        
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

describe "Unused arguments must pass through to subcommand" && {

  context "when groan is invoked" && {

    it "commands/test.sub.sh should be called with all of the unused arguments" && {
    
      out=$(./groan test this --or that --please)
      should_succeed

      expect $out to_be "Test successful: (this --or that --please)" 
    }
  }
}
