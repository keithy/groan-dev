#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

# Helper has no locations file, uses default values

describe "Test helper default command" && {

  context "standalone command: helper" && {
    it "runs helper default'" && (
       capture out <( ./helper/helper 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "options:"
       expect_array out to_contain "--theme=light*"
       expect_array out to_contain "usage:"
       expect_array out to_contain "helper <command|topic>"
       expect_array out to_contain "helper commands"
       expect_array out to_contain "helper --help*"
       expect_array out to_contain "Please give me a help topic"

    )
  }
 
  context "base subcommand help" && {
    it "runs helper default'" && (
       capture out <( ./base help 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*options:*"
       expect_array out to_contain "--theme=light*"
       expect_array out to_contain "*usage:*"
       expect_array out to_contain "base help <command|topic>"
       expect_array out to_contain "base help commands"
       expect_array out to_contain "base help --help*"
       expect_array out to_contain "Please give me a help topic"

    )
  }
 
  context "base subcommand help -h" && {
    it "runs helper default'" && (
       capture out <( ./base help -h 2>&1 )
        
       printf '[%s]\n' "${out[@]}"

       expect_array out to_contain "*options:*"
       expect_array out to_contain "--theme=light*"
       expect_array out to_contain "*usage:*"
       expect_array out to_contain "base help <command|topic>"
       expect_array out to_contain "base help commands"
       expect_array out to_contain "base help --help*"
       expect_array out not to_contain "Please give me a help topic"

    )
  }
}

