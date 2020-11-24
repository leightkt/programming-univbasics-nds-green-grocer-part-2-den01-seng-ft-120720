require_relative './part_1_solution.rb'
require 'pry'
# def apply_coupons(cart, coupons)
#   # Consult README for inputs and outputs
#   #
#   # REMEMBER: This method **should** update cart
#   updated_cart = Array.new
#   cart.each do |item|
#     coupons.each do |coupon|
#       if item[:item] == coupon[:item]
#         if item[:count] >= coupon[:num]
#         item[:count] -= coupon[:num]
#         discount_item = {}
#         discount_item[:item] = item[:item] + " W/COUPON"
#         discount_item[:price] = coupon[:cost] / coupon[:num]
#         discount_item[:clearance] = item[:clearance]
#         discount_item[:count] = coupon[:num]
#         updated_cart << discount_item
#         end
#       end
#     end
#     updated_cart << item 
#   end
#   updated_cart
# end

def apply_coupons(cart, coupons)
  cart.map{ |item|
    coupons.each{ |coupon|
      if item[:item] == coupon[:item] && item[:count] >= coupon[:num]
        item[:count] -= coupon[:num]
        cart.push({:item => item[:item] + " W/COUPON", 
        :price => coupon[:cost] / coupon[:num],
        :clearance => item[:clearance],
        :count => coupon[:num]
      })
      end
    }
  }
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  clearance_cart = []
  cart.each do |item|
    if item[:clearance] == true
      item[:price] = (item[:price] * 0.80).round(2)
    end
    clearance_cart << item
  end
    clearance_cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  consolidated_cart = consolidate_cart(cart)
  updated_cart = apply_coupons(consolidated_cart, coupons)
  discount_cart = apply_clearance(updated_cart)
  total = 0
  discount_cart.each do |item|
    total += item[:price] * item[:count]
  end
  if total > 100
    total = (total * 0.90).round(2)
  end  
  total
end
