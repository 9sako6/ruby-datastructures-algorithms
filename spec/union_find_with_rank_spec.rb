require "spec_helper"
require "./lib/union_find_with_rank"

describe UnionFindWithRank do
  context "クラスの作成" do
    it do
      uf = UnionFindWithRank.new(10)
      uf.merge(0, 1)
      expect(uf.root(1)).to eq(0) # uf.merge(1, 0) としていたら結果は1になります
      expect(uf.root(0)).to eq(0) # uf.merge(1, 0) としていたら結果は1になります
      expect { uf.merge(100, 0) }.to raise_error("UnionFindWithRank::IndexError")
      expect(uf.same?(1, 0)).to eq(true)
      expect(uf.same?(2, 0)).to eq(false)
      expect { uf.same?(100, 0) }.to raise_error("UnionFindWithRank::IndexError")
    end
  end

  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end
