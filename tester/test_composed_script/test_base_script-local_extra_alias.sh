#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script local aliasing to extra c_sub_cmds" && {

  context "basic_script 'crumbs' - aliased to 'breadcrumbs'" && {
    it "Displays 'Test successful message'" && (
      out=$(./base_script crumbs)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script crumbs" 
    )
  }

  context "basic_script crumbs --debug output" && {
    it "Displays debug output" && {
      capture out <( ./base_script -D crumbs 2>&1 )
        
      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "Config? /*/base_script.conf"
      expect_array out to_contain "Config? /*/.base_script.conf"
      expect_array out to_contain "Config? /*/test_composed_script/base_script.conf"
      expect_array out to_contain '*SCRIPT*base_script*'
      expect_array out to_contain "Sub-command: 'crumbs'"
      expect_array out to_contain "Looking for crumbs\*.sub.\* in:*"     
    }
  }

  context "base_script check that args get through" && {
    it "Displays 'base_script crumbs'" && (
      out=$(./base_script crumbs this --or that --please)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script crumbs" 
    )
  }
}

