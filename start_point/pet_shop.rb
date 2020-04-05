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
    #set default to fail
    successful_sale = true

    #check status before purchase
    customer_pet_count_presale = customer_pet_count(customer)

    # check if pet exits
    if find_pet_by_name(pet_shop, pet) != pet
        successful_sale = false
        p "no pet"
        return
    else
        successful_sale = true
        p "pet found"
    end
    
    if successful_sale == false
        "no pet - so decline"
        return false
    end

            
    # check if customer can afford pet
    
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)

    if can_buy_pet == true
        p "Yup - can afford"
    else
        successful_sale = false
    end


    if successful_sale == false
        return false
    end

    #add pet to customers list
    if can_buy_pet && successful_sale == true
    add_pet_to_customer(customer, pet)

     #increment pets sold
     if successful_sale == true
        pets_sold = 1
        increase_pets_sold(pet_shop, pets_sold)
        return successful_sale = true
        else
            return successful_sale = false
        end

    else
    return successful_sale = false
    end

    if successful_sale == false
        return false
    end

    #check customer pet list
    p "Customer has: #{customer_pet_count(customer)} pet(s) after sale"

    if customer_pet_count(customer) == customer_pet_count_presale
        successful_sale = false
        return
    else 
        successful_sale = true
    end

    #remove pet from pet shop
    remove_pet_by_name(pet_shop, pet)

   

    #take_cash
    if successful_sale == true
        amount_to_take = pet[:price]
    remove_customer_cash(customer, amount_to_take)
    else 
        return successful_sale = false
    end
    
    if successful_sale == true
    remove_customer_cash(customer, pet[:price])
    p "pet[:price]) #{pet[:price]}"
    else
        return successful_sale = false
    end

    #add to cash register
    add_or_remove_cash(pet_shop, pet[:price])
        




    return successful_sale
end
