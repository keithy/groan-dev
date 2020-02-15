#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Unrecognised subcommand" && {

  context "standalone" && {

    it "should display a not found message" && {

      out=$(./groan not-ever)
      should_fail

      expect "$out" to_match "Not Found: groan .*not-ever.*" 
    }
  }
  
  context "with debug output" && {
  
    it "should show the search" && {

       capture out <( ./groan -D not-ever 2>&1 )
        
       $LOUD && printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Sub-command: 'not-ever'"
       expect_array out to_contain "Looking for not-ever\*.sub.\* in:*"     
    }
  }
}