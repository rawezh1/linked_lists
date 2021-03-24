# frozen_string_literal: true

# A list of nodes
class LinkedList
  attr_accessor :nodes

  def initialize
    @nodes = nil
  end

  def append(value)
    if @nodes.nil?
      @nodes = Node.new(value)
    else
      current_node = @nodes
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @nodes = if @nodes.nil?
               Node.new(value)
             else
               Node.new(value, @nodes)
             end
  end

  def tail
    current_node = @nodes
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def head
    Node.new(@nodes.value)
  end

  def size
    counter = 0
    current_node = @nodes
    loop do
      break if current_node.nil?

      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def at(index)
    counter = 0
    current_node = @nodes
    until counter == index
      current_node = current_node.next_node
      counter += 1
    end
    Node.new(current_node.value)
  end

  def pop
    if @nodes.nil?
      @nodes
    elsif @nodes.next_node.nil?
      @nodes = nil
    else
      current_node = @nodes
      current_node = current_node.next_node until current_node.next_node.next_node.nil?
      current_node.next_node = nil
    end
  end

  def contains?(value)
    result = false
    current_node = @nodes
    until current_node.nil?
      result = true if current_node.value == value
      current_node = current_node.next_node
    end
    result
  end

  def to_s
    current_node = @nodes
    string = ''
    loop do
      if current_node.nil?
        string += 'nil'
        break
      end
      string += "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    string
  end

  def remove_at(index)
    counter = 0
    current_node = @nodes
    result = LinkedList.new
    until counter == index
      result.append(current_node.value)
      current_node = current_node.next_node
      counter += 1
    end
    loop do
      current_node = current_node.next_node
      break if current_node.nil?

      result.append(current_node.value)
    end
    result
  end
end

# An element of a list of nodes, with a value and a pointer to next node in list
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list_a = LinkedList.new
list_a.append(3)
list_a.append(4)
list_a.append(5)
puts list_a.to_s
list_a = list_a.remove_at(1)
p list_a
