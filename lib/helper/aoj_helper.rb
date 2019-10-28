#
# AOJ Helper
#   AOJ API reference: http://developers.u-aizu.ac.jp/index
#
require "net/http"
require "uri"
require "json"
require "./lib/helper/progress_bar.rb"

module AOJHelper
  @endpoint = "https://judgedat.u-aizu.ac.jp".freeze

  def self.get_testcase(problem_id, serial)
    uri = URI.parse(@endpoint + "/testcases/#{problem_id}/#{serial}")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

  def self.get_header(problem_id)
    uri = URI.parse(@endpoint + "/testcases/#{problem_id}/header")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

  module Problems
    @problems_list_file = {
      "bellman_ford.rb" => {
        category: "Graph",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/GRL_1_B",
      },
      "binary_indexed_tree.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/DSL_2_B",
      },
      "dijkstra.rb" => {
        category: "Graph",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/5/GRL/1/GRL_1_A",
      },
      "dinic.rb" => {
        category: "Network Flow",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/GRL_6_A",
      },
      "edmonds_karp.rb" => {
        category: "Network Flow",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/GRL_6_A",
      },
      "fibonacci.rb" => {
        category: "Math",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/ALDS1_10_A",
      },
      "ford_fulkerson.rb" => {
        category: "Network Flow",
        url: "https://onlinejudge.u-aizu.ac.jp/problems/GRL_6_A",
      },
      "merge_sort.rb" => {
        category: "Sort",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/lesson/1/ALDS1/5/ALDS1_5_B",
      },
      "priority_queue.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/solutions/problem/ALDS1_9_C",
      },
      "range_minimum_query.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_2_A",
      },
      "range_update_query.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_2_D",
      },
      "segment_tree.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_2_A",
      },
      "union_find_weighted.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_1_B",
      },
      "union_find_with_size.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_1_A",
      },
      "union_find_with_rank.rb" => {
        category: "Data Structure",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_1_A",
      },
      "warshall_floyd.rb" => {
        category: "Graph",
        url: "https://onlinejudge.u-aizu.ac.jp/courses/library/5/GRL/1/GRL_1_C",
      },
    }
    def self.problem_id(library_name)
      File.basename(@problems_list_file[library_name][:url])
    end

    def self.problem_category(library_name)
      @problems_list_file[library_name][:category]
    end

    def self.problem_url(library_name)
      @problems_list_file[library_name][:url]
    end

    def self.libraries_list
      @problems_list_file.keys.uniq
    end

    def self.url_list
      @problems_list_file.values.map { |v| v[:url] }.uniq
    end
  end
end
