#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Test handling of missing setup command" && {

  context "base setup missing" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base setup missing 2>&1)
      should_fail

      echo "[$out]"
       
      expect $out to_contain "Not Found: *base setup *missing*" 
    )
  }
 
}

