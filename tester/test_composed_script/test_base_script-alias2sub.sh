#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script alias" && {

  context "base_script alias" && {
    it "Displays: base_script alias" && (
      out=$(./base_script alias)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script alias" 
    )
  }
}

