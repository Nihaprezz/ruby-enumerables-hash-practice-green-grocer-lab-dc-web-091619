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
        cart[]
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
