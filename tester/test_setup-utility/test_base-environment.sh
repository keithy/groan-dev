#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Testing: base setup environment" && {

  context "base setup environment" && {
   
    it "Displays environment" && {
       capture out <( ./base setup environment 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "SHELL=/bin/bash"
    }
  }
}

