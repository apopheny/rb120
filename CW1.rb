# https://www.codewars.com/kata/55cd4ce59382498cbd000080/train/ruby

=begin
Oh no! Timmy's List Class has broken! Can you help timmy and fix his class? Timmy has a List class he has created, this is used for type strict arrays (which timmy calls Lists).

When timmy calls the Counter property of the list it still remains at 0 when adding items.

Also it fails when timmy trys to chain the adds e.g.

my_list.add(0).add(1)
=end

class List
  attr_reader :counter, :type
  
  def initialize(type)
    @type=type
    @items=[]
    @counter=0
  end
  
  def add(item)
    if item.class!=@type then return "This item is not of type: #{type}" end
    @items+=[item]
    @counter = @items.size
    self
  end

end

my_list=List.new(String)

p my_list.add('Hello').counter == 1
p my_list.add(5) == "This item is not of type: String"
p my_list.add(' ').add('World!').counter == 3