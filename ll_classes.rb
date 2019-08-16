
class UserInfo
  attr_accessor :name, :wallet
  
  def initialize
    puts "\nWhat is your name?"
    print "> "
    @name = gets.strip
    # puts "\nHow much are you looking to spend?"
    # print "> "
    # @wallet = gets.strip.to_i
  end

end

class Order
  attr_accessor :list
  def initialize
    @list = []
  end

  def total
    sum_total = 0
    @list.each {|item| sum_total += item[:price]}
    sum_total
  end

end