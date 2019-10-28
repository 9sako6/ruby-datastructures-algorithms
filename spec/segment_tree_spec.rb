require "spec_helper"
require "./lib/segment_tree"

describe SegmentTree do
  context "クラスの作成" do
    it do
      seg = SegmentTree.new(10, 0) { |x, y| x.gcd(y) }
      expect(seg.class).to eq(SegmentTree)
    end
  end
  context "solve AOJ" do
    it "AC" do
      aoj_solve_test(__FILE__)
    end
  end
end