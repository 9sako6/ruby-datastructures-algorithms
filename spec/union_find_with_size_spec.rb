require "spec_helper"
require "./lib/union_find_with_size"

describe UnionFindWithSize do
  context "クラスの作成" do
    it do
      uf = UnionFindWithSize.new(10)
      uf.merge(0, 1)
      expect(uf.root(1)).to eq(0) # uf.merge(1, 0) としていたら結果は1になります
      expect(uf.root(0)).to eq(0) # uf.merge(1, 0) としていたら結果は1になります
      expect(uf.size(0)).to eq(2)
      expect(uf.size(1)).to eq(2)
      expect(uf.size(3)).to eq(1)
      expect { uf.merge(100, 0) }.to raise_error("UnionFindWithSize::IndexError")
      expect(uf.same?(1, 0)).to eq(true)
      expect(uf.same?(2, 0)).to eq(false)
      expect { uf.same?(100, 0) }.to raise_error("UnionFindWithSize::IndexError")
    end
  end
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end
