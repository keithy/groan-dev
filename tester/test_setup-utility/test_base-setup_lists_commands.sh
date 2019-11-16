#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh
 
describe "Testing: base setup - lists setup commands" && {

  context "base setup" && {
    it "runs _default.sub.sh'" && {
       capture out <( ./base setup 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*setup utility commands:*"
 
       expect_array out to_contain "base setup * list available commands"

       expect_array out to_contain "base setup configure * select or edit configuration file"

       expect_array out to_contain "base setup environment * show script/environment variables"

       expect_array out to_contain "base setup new * create a new project using template"
 
       expect_array out to_contain "base setup self-install * install in system"

    }
  }
}

