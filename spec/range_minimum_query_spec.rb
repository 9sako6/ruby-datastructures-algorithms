require "spec_helper"
require "./lib/range_minimum_query"

describe RMQ do
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end