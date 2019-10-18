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


       #default commands occur twice
       expect_array out to_contain "base help * show topical help"
       occurring 2 times

       expect_array out to_contain "base remotes             * deploy and execute on remote servers"
       occurring 2 times 

       expect_array out to_contain "base remotes exec      * execute commands on remote hosts"
       occurring 1 times 

       expect_array out to_contain "base remotes test  * test remote connections via ssh"
       occurring 1 times 

    }
  }
}

