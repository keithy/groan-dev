#!/bin/bash

source ../bash-spec-2/bash-spec.sh

describe "Testee" && {
  context "A dummy executable" && {
    it "succeeds and echo's test" && (
      out=$(./dummy)
      echo "[$out]"
      expect $out to_be "test"
      expect $? to_be "0"
    )
  }
}

