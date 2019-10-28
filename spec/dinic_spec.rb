require "spec_helper"
require "./lib/dinic"

describe Dinic do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end