#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base script" && {

  context "subcommand environment" && {
   
    it "Displays environment" && {
       capture out <( ./basic_script environment 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "SHELL=/bin/bash"
    }
  }
}

