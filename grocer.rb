def consolidate_cart(cart)
  new_cart = {}
  
  cart.each do |element_hash|
    element_name = element_hash.keys[0]
    
    if new_cart.has_key?(element_name)
      new_cart[element_name][:count] += 1
    else
      new_cart[element_name] = {
        count: 1, 
        price: element_hash[element_name][:price], 
        clearance: element_hash[element_name][:clearance]
      }
    end
  end
  
  new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item]
      if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance] , count: coupon[:num]}
      elsif cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
      end
      cart[item][:count] -= coupon[:num]
    end
  end
  cart   
end

def apply_clearance(cart)
  cart.each do |product_name, stats|
    stats[:price] -= stats[:price] * 0.2 if stats
  end
   
   cart
end

def checkout(cart, coupons)
  # code here
end
