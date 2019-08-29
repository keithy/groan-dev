#!/usr/bin/env bash

source ../bash-spec-2/bash-spec.sh

describe "Test groan base_script breadcrumbs" && {

  context "base_script breadcrumbs" && {
    it "Displays: base_script breadcrumbs" && (
      out=$(./base_script breadcrumbs)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script breadcrumbs" 
    )
  }
  context "base_script level breadcrumbs" && {
    it "Displays: base_script level breadcrumbs" && (
      out=$(./base_script level breadcrumbs)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script level breadcrumbs" 
    )
  }

  context "base_script level level breadcrumbs" && {
    it "Displays: base_script level level breadcrumbs" && (
      out=$(./base_script level level breadcrumbs)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script level level breadcrumbs" 
    )
  }

  context "base_script level level level breadcrumbs" && {
    it "Displays: base_script level level level breadcrumbs" && (
      out=$(./base_script level level level breadcrumbs)
      should_succeed

      echo "[$out]"
      expect $out to_be "base_script level level level breadcrumbs" 
    )
  }

}

