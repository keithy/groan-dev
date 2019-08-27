#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

rm -f /usr/local/bin/basic_script

describe "Test groan base_script self-install" && {

  context "self-install and no action" && {
    it "Displays error message" && {
      out=$(./basic_script self-install)
      should_fail

      echo "[$out]"
      
      expect $out to_be "No action specified ( --link )" 
    }
  }


  context "self-install and destination not on path" && {
    it "Displays error message" && {
      out=$(./basic_script self-install . --link)
      should_fail

      echo "[$out]"
      
      expect $out to_be "Your PATH does not include ., please specify a valid path." 
    }
  }

  context "self-install /usr/local/bin --unlink" && {
   
    it "Performs self-install --unlink --confirm" && {
   
      capture out <(./basic_script self-install --unlink --confirm 2>&1)
      out=$(./basic_script self-install --unlink)
      should_fail

      echo "[$out]"
      
      expect $out to_match "Not a link: .*/basic_script - leaving well alone" 
    }
  }

  context "self-install /usr/local/bin --link" && {
   
    it "Performs self-install  /usr/local/bin --link" && {
   
      capture out <(./basic_script self-install /usr/local/bin --link 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "ln -s */tester/test_basic_script/basic_script /usr/local/bin/basic_script"
      expect_array out to_contain "dryrun: --confirm required to proceed"
    }
  }

  context "self-install /usr/local/bin --link" && {
   
    it "Performs self-install  /usr/local/bin --link" && {
   
      capture out <(./basic_script self-install /usr/local/bin --link --confirm 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "ln -s */tester/test_basic_script/basic_script /usr/local/bin/basic_script"
      expect_array out not to_contain "*basic_script: File exists"
      expect_array out not to_contain "dryrun*"
    }
  }
}

rm -f /usr/local/bin/basic_script
