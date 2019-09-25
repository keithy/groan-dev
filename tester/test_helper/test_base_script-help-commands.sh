#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Testing help comands list" && {

  context "base_script help commands" && {
    it "runs helper default'" && {
       capture out <( ./base_script help commands 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*base_script commands:*"
       expect_array out to_contain "base_script breadcrumbs * show breadcrumbs"
 
       expect_array out to_contain "*helper commands:*"
       expect_array out to_contain "base_script help breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level1 commands:*"
       expect_array out to_contain "base_script level breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level2 commands:*"
       expect_array out to_contain "base_script level level breadcrumbs * show breadcrumbs"

       expect_array out to_contain "*level3 commands:*"
       expect_array out to_contain "base_script level level breadcrumbs * show breadcrumbs"

       #default commands occur twice
       expect_array out to_contain "base_script help * show topical help"
       occurring 2 time

       expect_array out to_contain "base_script level             * report level"
       occurring 1 times 

       expect_array out to_contain "base_script level level       * report level"
       occurring 1 time 

       expect_array out to_contain "base_script level level level * report level"
       occurring 2 times 

    }
  }
}

