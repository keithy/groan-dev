#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script" && {

  context "base_script test --debug output" && {
    it "Displays debug output" && {
      capture out <(./base_script version --theme=0)
        
      $LOUD && printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "*:(test_composed_script) "
      expect_array out to_contain "*:(test_composed_script) base_script"
      expect_array out to_contain "*:        (level1) base_script level"
      expect_array out to_contain "*:        (level2) base_script level level"
      expect_array out to_contain "*:        (level3) base_script level level level"
    }
  }  
}

