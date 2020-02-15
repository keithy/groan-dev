#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Subcommands implemented *.exec - should execute via subshell" && {

  context "when invoked without arguments" && {

    it "groan test-exec - should display 'Test successful message'" && (
      out=$(./groan test-exec)
      should_succeed

      expect $out to_be "Test successful: ()" 
    )
  }
}

describe "Unused arguments must pass through to subcommand" && {

  context "when groan is invoked" && {

    it "commands/test.sub.sh should be called with all of the unused arguments" && {
    
      out=$(./groan test-exec this --or that --please)
      should_succeed

      expect $out to_be "Test successful: (this --or that --please)" 
    }
  }
}
