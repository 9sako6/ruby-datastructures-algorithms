class PriorityQueue
  def initialize(&comp)
    @heap = []
    @node_num = 0
    if !block_given?
      @comp = Proc.new { |x, y| x <= y }
    else
      @comp = comp
    end
  end

  attr_reader :heap

  def push(x)
    current_node_num = @node_num
    @node_num += 1
    while current_node_num > 0
      parent_node_num = (current_node_num - 1) / 2
      break if @comp.call(@heap[parent_node_num], x) # 逆転してないなら抜ける
      # 親ノードを下ろして自分を上に
      @heap[current_node_num] = @heap[parent_node_num]
      current_node_num = parent_node_num
    end
    @heap[current_node_num] = x
  end

  alias_method(:<<, :push)

  def pop
    # 最(小|大)値
    ret = @heap[0]
    # 根にもってくる値
    @node_num -= 1
    x = @heap[@node_num]
    # 根から下ろしていく
    i = 0
    while (a = i * 2 + 1) < @node_num
      # 子どうしを比較
      b = a + 1
      a = b if b < @node_num && @comp.call(@heap[b], @heap[a])
      break unless @comp.call(@heap[a], x)
      @heap[i] = @heap[a]
      i = a
    end
    @heap[i] = x
    return ret
  end

  def get
    @node_num == 0 ? nil : @heap[0]
  end

  def empty?
    return get.nil?
  end
end

__END__
# 計算量
# - ヒープ作成: O(N)
# - push: O(log N)
# - pop: O(log N)
# - get: O(1)

# 最大値を取り出すheapを作る場合は、
# 追加する値の符号を反転してpushするか、
# PriorityQueue.new{ |x, y| x > y }とする
# ブロック引数に比較関数を定義すればどんなオブジェクトも要素に入れられる

q = PriorityQueue.new
q.push(3)
q.push(5)
q.push(1)
q << 0
