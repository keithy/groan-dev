#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Test handling of missing help command" && {

  context "base help" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base help missing 2>&1)
      should_fail

      echo "[$out]"
       
      expect $out to_contain "Not Found: *base help *missing*" 
    )
  }
 
}

