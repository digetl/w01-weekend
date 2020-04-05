def pet_shop_name(pet_shop)
    pet_shop[:name]
end

def total_cash(pet_shop)
    pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
    pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
    pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets)
    pet_shop[:admin][:pets_sold] += pets
end

def stock_count(pet_shop)
    pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed_name)
    pet_list = []
    for pet in pet_shop[:pets]
      if pet[:breed] == breed_name 
        pet_list.push(pet)
      end
    end
    return pet_list
end

def find_pet_by_name(pet_shop, pet_name)
    
    for pet in pet_shop[:pets]
      if pet[:name] == pet_name 
        pet_found =(pet)
      end
    end
    return pet_found
end

def remove_pet_by_name(pet_shop, pet_name)
    new_pets=[]
    count = 0
    for pet in pet_shop[:pets]
        if pet[:name] == pet_name
            new_pets == pet_shop[:pets].delete_at(count)
        else
            count += 1
        end
    end
      
      return new_pets
end

def add_pet_to_stock(pet_shop, new_pet)
pet_shop[:pets].push(new_pet)
end

def customer_cash(customers)
return customers[:cash]
end

def remove_customer_cash(custmomer, amount)
    custmomer[:cash] -= amount
end

def customer_pet_count(customer)
    customer[:pets].count
end

# def customer_pet_count(customer) #dave's wrong answer
#     customer_pet_list = 0 # Set counter to 0
#     for pets in customer #for every pet the customer has
#         customer_pet_list += customer[:pets].count #Add to the count
#     end

#     return customer_pet_list #return the count
# end

def add_pet_to_customer(customer, pet)
    customer[:pets].push(pet)
end

def customer_can_afford_pet(customer,new_pet_to_buy)
    if customer == nil 
        return false
        
    elsif customer[:cash] >= new_pet_to_buy[:price]
        
        return true
    else
        return false
    end
end

def sell_pet_to_customer(pet_shop, pet, customer)
    #check status before purchase
    customer_pet_count_presale = customer_pet_count(customer)
    p "Customer has: #{customer_pet_count_presale} pets"
    successful_sale = false
    #check if customer can afford pet
    if customer_can_afford_pet(customer,pet)
        successful_sale = true
    else
        successful_sale = false
    end

    #check pet was added to customers pet list
    
    if customer_pet_count(customer)
    end




    return successful_sale
end
