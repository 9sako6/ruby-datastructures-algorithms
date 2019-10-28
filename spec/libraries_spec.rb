require "spec_helper"

describe "全てのライブラリのテストが用意されているか" do
  it do
    tests = {}
    Dir["./spec/*_spec.rb"].map do |fname|
      fname = fname.split("/")[-1].gsub("_spec", "")
      tests[fname] = fname
    end
    Dir["./lib/*.rb"].map { |fname| fname.split("/")[-1] }.each do |library|
      expect(tests[library]).to eq(library)
    end
    Dir["./spec/aoj_solver/*.rb"].map { |fname| fname.split("/")[-1] }.each do |library|
      expect(tests[library]).to eq(library)
    end
  end
end
