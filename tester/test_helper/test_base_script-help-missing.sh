#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Test groan base_script help missing" && {

  context "base_script help" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base_script help missing 2>&1)
      should_fail

      echo "[$out]"
       
      expect $out to_contain "Not Found: *base_script help* sub-command: '*missing*'." 
    )
  }
 
}

