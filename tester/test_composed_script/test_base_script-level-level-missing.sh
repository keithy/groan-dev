#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Test handling of missing commands" && {

  context "root level" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base_script missing 2>&1)
      should_fail

      expect $out to_contain "Not Found: base_script *missing*" 
    )
  }
  
  context "level1" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base_script level missing 2>&1)
      should_fail

      expect $out to_contain "Not Found: base_script level *missing*" 
    )
  }
  
  context "level2" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base_script level level missing 2>&1)
      should_fail
     
      expect $out to_contain "Not Found: base_script level level *missing*" 
    )
  }
  
  context "level3" && {
    it "Fails and displays 'Not Found:'" && (
      out=$(./base_script level level level missing 2>&1)
      should_fail
      
      expect $out to_contain "Not Found: base_script level level level *missing*" 
    )
  }
}

