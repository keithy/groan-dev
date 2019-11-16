#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Testing help topics list" && {

  context "base help topics" && {
    it "runs helper topics'" && {
       capture out <( ./base help topics 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*helper topics:*"
       expect_array out to_contain "base help topic *writing-topics*"
       expect_array out to_contain "base help topic *writing-text*"
    }
  }
}