#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script level" && {

 context "base_script level report-level" && {
    it "Displays: Level: 1" && {
      out=$(./base_script level report-level)
      should_succeed

      expect "$out" to_be "Level: 1" 
    }
  }

  context "base_script level" && {
    it "Displays: Level: 1" && {
      out=$(./base_script level)
      should_succeed

      expect "$out" to_be "Level: 1" 
    }
  }
  context "base_script level level" && {
    it "Displays: Level: 2" && {
      out=$(./base_script level level)
      should_succeed

      expect "$out" to_be "Level: 2" 
    }
  }

  context "base_script level level level" && {
    it "Displays: Level: 3" && {
      out=$(./base_script level level level)
      should_succeed

      expect "$out" to_be "Level: 3" 
    }
  }

    context "base_script level level level report-level" && {
    it "Displays: Level: 3" && {
      out=$(./base_script level level level report-level)
      should_succeed

      expect "$out" to_be "Level: 3" 
    }
  }

}

