require "spec_helper"
require "./lib/levenshtein_distance"

describe "LevenshteinDistance" do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end
