    require "spec_helper"
    require "./lib/edmonds_karp"
    
    describe EdmondsKarp do
      context "solve AOJ" do
        it "AC" do
          aoj_solve_test(__FILE__)
        end
      end
    end
