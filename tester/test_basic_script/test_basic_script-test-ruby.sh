#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script test-ruby" && {

  context "base_script test-ruby" && {
    it "Displays 'Test successful message Hello its ruby!'" && {
      out=$(./basic_script test-ruby)
      should_succeed

      echo "[$out]"
      expect $out to_be "Hello its ruby!" 
    }
  }

  context "base_script test --debug output" && {
    it "Displays debug output" && {
       capture out <( ./basic_script -D test-ruby 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Config? /*/basic_script.conf.sh"
       expect_array out to_contain "Config? /*/.basic_script.conf.sh"
       expect_array out to_contain "Config? /*/test_basic_script/basic_script.conf.sh"
       expect_array out to_contain '*SCRIPT*basic_script*'
       expect_array out to_contain "Sub-command: 'test-ruby'"
       expect_array out to_contain "Looking for test-ruby\*.sub.\* in:*"     
    }
  }
}

