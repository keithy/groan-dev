#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script" && {

  context "ambiguous sub-command" && {
    it "Displays ambiguous message" && {
      out=$(./basic_script tes)
      should_fail

      echo "[$out]"
      
      expect $out to_be "Multiple options exist for requested 'tes' (test-ruby test)" 
    }
  }

  context "ambiguous sub-command --debug output" && {
    it "Displays multiple found scripts" && {
       capture out <( ./basic_script --debug tes 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Found #1*"
       expect_array out to_contain "Found #2*"
     
    }
  }
}

