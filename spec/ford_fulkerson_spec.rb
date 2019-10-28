require "spec_helper"
require "./lib/ford_fulkerson"

describe FordFulkerson do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end