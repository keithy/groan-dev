#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script" && {

  context "base_script test" && {
    it "Displays 'Test successful message'" && (
      out=$(./base_script test)
      should_succeed

      expect $out to_be "Test successful: ()" 
    )
  }

  context "base_script test --debug output" && {
    it "Displays debug output" && {
      capture out <( ./base_script -D test 2>&1 )
        
      $LOUD && printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "Config? /*/base_script.conf"
      expect_array out to_contain "Config? /*/.base_script.conf"
      expect_array out to_contain "Config? /*/test_*/base_script.conf"
      expect_array out to_contain '*SCRIPT*base_script*'
      expect_array out to_contain "Sub-command: 'test'"
      expect_array out to_contain "Looking for test\*.sub.\* in:*"     
    }
  }

  context "base_script test that args get through" && {
    it "Displays 'Test successful message'" && (
      out=$(./base_script test this --or that --please)
      should_succeed

      expect $out to_be "Test successful: (this --or that --please)" 
    )
  }
}

