#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Ambiguous Subcommand" && {

  context "standalone" && {
  
    it "should display an informative and useful message" && {

      out=$(./groan tes)
      should_fail

      $LOUD && echo "[$out]"
      
      expect $out to_be "Multiple options exist for requested 'tes' (test-exec test-ruby test)" 
      
    }

  }

  context "with debug output" && {

    it "displays all possible matches" && {
       capture out <( ./groan --debug tes 2>&1 )
        
       $LOUD && printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Found #1*"
       expect_array out to_contain "Found #2*"
     
    }
  }
}

