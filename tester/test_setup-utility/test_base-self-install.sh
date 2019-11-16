#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

rm -f /usr/local/bin/base

describe "Testin: base setup self-install" && {

  context "self-install and no action" && {
    it "Displays error message" && {
      out=$(./base setup self-install)
      should_fail

      echo "[$out]"
      
      expect $out to_be "No action specified ( --link )" 
    }
  }


  context "self-install and destination not on path" && {
    it "Displays error message" && {
      out=$(./base setup self-install . --link)
      should_fail

      echo "[$out]"
      
      expect $out to_be "Your PATH does not include ., please specify a valid path." 
    }
  }

  context "self-install /usr/local/bin --unlink" && {
   
    it "Performs self-install --unlink --confirm" && {
   
      capture out <(./base setup self-install --unlink --confirm 2>&1)
      out=$(./base setup self-install --unlink)
      should_fail

      echo "[$out]"
      
      expect $out to_match "Not a link: .*/base setup - leaving well alone" 
    }
  }

  context "self-install /usr/local/bin --link" && {
   
    it "Performs self-install  /usr/local/bin --link" && {
   
      capture out <(./base setup self-install /usr/local/bin --link 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "ln -s */tester/test_base/base setup /usr/local/bin/base"
      expect_array out to_contain "dryrun: --confirm required to proceed"
    }
  }

  context "self-install /usr/local/bin --link" && {
   
    it "Performs self-install  /usr/local/bin --link" && {
   
      capture out <(./base setup self-install /usr/local/bin --link --confirm 2>&1)
      should_succeed

      printf '[%s]\n' "${out[@]}"
 
      expect_array out to_contain "ln -s */tester/test_base/base setup /usr/local/bin/base"
      expect_array out not to_contain "*base: File exists"
      expect_array out not to_contain "dryrun*"
    }
  }
}

rm -f /usr/local/bin/base
