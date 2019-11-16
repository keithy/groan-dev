#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Testing help comands list" && {

  context "base_script help commands" && {
    it "runs helper default'" && {
       capture out <( ./base help commands 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*base commands:*"
 
       expect_array out to_contain "*helper commands:*"
       expect_array out to_contain "base help breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level1 commands:*"
       expect_array out to_contain "base level breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level2 commands:*"
       expect_array out to_contain "base level level breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level3 commands:*"
       expect_array out to_contain "base level level breadcrumbs * show breadcrumbs"

       #default commands occur twice
       expect_array out to_contain "base help * show topical help"
       occurring 2 times

       expect_array out to_contain "base level             * report level"
       occurring 2 times 

       expect_array out to_contain "base level level       * report level"
       occurring 2 times 

       expect_array out to_contain "base level level level  * report level"
       occurring 2 times 

    }
  }
}

