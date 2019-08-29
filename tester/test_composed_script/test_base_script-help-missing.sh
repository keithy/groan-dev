#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Test groan base_script help missing" && {

  context "base_script help" && {
    it "Displays 'Test successful message'" && (
      out=$( ./base_script help missing)
      should_fail

      echo "[$out]"
       
      expect $out to_match "Not Found: .*base_script help.* sub-command '.*missing.*'." 
    )
  }
 
}

