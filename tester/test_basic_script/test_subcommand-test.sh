#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base script" && {

  context "subcommand test" && {
    it "Displays 'Test successful message'" && (
      out=$(./basic_script test)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: ()" 
    )
  }

  context "subcommand test --debug output" && {
    it "Displays debug output" && {
       capture out <( ./basic_script -D test 2>&1 )
        
       printf '[%s]\n' "${out[@]}"
 
       expect_array out to_contain "Looked for config in: /*/basic_script.conf.sh"
       expect_array out to_contain "Looked for config in: /*/.basic_script.conf.sh"
       expect_array out to_contain "Looked for config in: /*/test_basic_script/basic_script.conf.sh"
       expect_array out to_contain 'commandName: basic_script'
       expect_array out to_contain "Sub-command: 'test'"
       expect_array out to_contain "Looking for test\*.sub.\* in:*"     
    }
  }

  context "subcommand test that args get through" && {
    it "Displays 'Test successful message'" && (
      out=$(./basic_script test this --or that --please)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: (this --or that --please)" 
    )
  }
}
