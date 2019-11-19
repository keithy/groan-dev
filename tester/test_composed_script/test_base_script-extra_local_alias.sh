#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script local aliasing of c_sub_cmds" && {

  context "basic_script 'check' - aliased to 'test'" && {
    it "Displays 'Test successful message'" && (
      out=$(./base_script check)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: ()" 
    )
  }

  context "basic_script check --debug output" && {
    it "Displays debug output" && {
      capture out <( ./base_script -D check 2>&1 )
        
      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "Config? /*/base_script.conf.sh"
      expect_array out to_contain "Config? /*/.base_script.conf.sh"
      expect_array out to_contain "Config? /*/test_composed_script/base_script.conf.sh"
      expect_array out to_contain '*SCRIPT*base_script*'
      expect_array out to_contain "Sub-command: 'check'"
      expect_array out to_contain "Looking for check\*.sub.\* in:*"     
    }
  }

  context "base_script check that args get through" && {
    it "Displays 'Test successful message'" && (
      out=$(./base_script check this --or that --please)
      should_succeed

      echo "[$out]"
      expect $out to_be "Test successful: (this --or that --please)" 
    )
  }
}

