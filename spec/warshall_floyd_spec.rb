require "spec_helper"
require "./lib/warshall_floyd"

describe "WarshallFloyd" do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end
