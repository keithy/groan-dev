#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base script" && {

  context "subcommand test-ruby" && {
    it "Displays 'Test successful message'" && {
      out=$(./basic_script test-ruby)
      should_succeed

      echo "[$out]"
      expect $out to_be "Hello its ruby!" 
    }
  }

  context "subcommand test --debug output" && {
    it "Displays debug output" && {
       capture out <( ./basic_script -D test-ruby 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Looked for config in: /*/basic_script.conf.sh"
       expect_array out to_contain "Looked for config in: /*/.basic_script.conf.sh"
       expect_array out to_contain "Looked for config in: /*/test_basic_script/basic_script.conf.sh"
       expect_array out to_contain 'commandName: basic_script'
       expect_array out to_contain "Sub-command: 'test-ruby'"
       expect_array out to_contain "Looking for test-ruby\*.sub.\* in:*"     
    }
  }
}

