#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script test-ruby" && {

  context "base_script test-ruby" && {
    it "Displays 'Test successful message Hello its ruby!'" && {
      out=$(./groan test-ruby)
      should_succeed

      expect $out to_be "Hello its ruby!" 
    }
  }
}

