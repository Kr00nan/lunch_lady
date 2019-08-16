require_relative "ll_classes"
require "pry"

# I was able to get the primary and some of the bonus objectives.
# I had difficulties trying to format integers to a currency format.
# I tried googling some of the answers but none of the solutions worked for me.
# I'd be interested to see the solution on this one if it includes the bonus objectives.

class LunchLady

  def initialize
    @order = Order.new
    @user = UserInfo.new
    @menu = [
      {:name => "Hamburger", :price => 3, :type => "main"},
      {:name => "Pizza", :price => 5, :type => "main"},
      {:name => "Hotdog", :price => 2, :type => "main"},
      {:name => "Chicken Sandwich", :price => 4, :type => "main"},
      {:name => "French Fries", :price => 3, :type => "side"},
      {:name => "Tatter tots", :price => 3, :type => "side"},
      {:name => "Side Salad", :price => 3, :type => "side"}
    ]
    main_menu
  end

  def main_menu
    puts "\n-- Welcome #{@user.name} to Ruby Cafe --"
    puts "Choose from the following options:"
    puts " 1) Order"
    puts " 2) Clear order"
    puts " 3) Checkout"
    puts " 4) Exit"
    print "> "

    case gets.strip
    when "1"
      food_menu
    when "2"
      clear_order
    when "3"
      if @order.list.empty?
        cart_empty
      end
      checkout
    when "4"
      exit_program
    else
      puts "\nI didn't recognize the input. Could you try again?"
      main_menu
    end
  end

  def food_menu
    puts "\nWhat would you like to order?"
    puts " 1) Main entrees"
    puts " 2) Side items"
    puts " 3) Back to main menu"
    print "> "

    case gets.strip
    when "1"
      display_dishes("main")
    when "2"
      display_dishes("side")
    when "3"
      main_menu
    else
      puts "\nI didn't recognize the input. Could you try again?"
      food_menu
    end
  end

  def display_dishes(menu)
    menu1 = []
    @menu.each_with_index do |item, index|
      if item[:type] == menu
        menu1.push(item)
      end
    end
    menu1.each_with_index do |item, index|
      puts " #{index + 1}) #{item[:name]} Price: $#{item[:price]}"
    end
    puts "What would you like to order?"
    print "> "

    index = gets.to_i - 1
    item = menu1[index]
    @order.list.push(item)
    puts "\nWould you like to order anything else? y/n"
    print "> "
    
    if gets.strip == "y"
      food_menu
    else
      main_menu
    end
  end

  def clear_order
    @order.list.clear
    puts "\nYour order has been cleared."
    puts "Returning to the main menu..."
    main_menu
  end

  def checkout
    puts "\nHere are the items in your order:"
    @order.list.each {|item| puts " :: #{item[:name]} --- $#{item[:price]}"}
    puts "____________________"
    puts "Your total is: $#{@order.total} dollars."
    exit_program
  end

  def cart_empty
    puts "Your cart is empty."
    puts "Returning to the main menu..."
    main_menu
  end

  def exit_program
    puts "\nThanks for coming by! Hope to see you again!"
    puts
    exit(true)
  end

end
LunchLady.new