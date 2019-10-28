require "spec_helper"
require "./lib/bellman_ford"

describe "Bellman-Ford" do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end