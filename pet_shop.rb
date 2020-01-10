


def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, check_breed)
  pets_of_same_breed = []
  for pet in pet_shop[:pets]
    if check_breed == pet[:breed]
      pets_of_same_breed.push(pet[:breed])
    end
  end
  return pets_of_same_breed
end

def find_pet_by_name(pet_shop, check_name)
  for pet in pet_shop[:pets]
    if check_name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_to_remove)
  for pet in pet_shop[:pets]
    if pet_to_remove == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customers, amount)
  customers[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

# Optional Work

def customer_can_afford_pet(customer, new_pet)
  if customer_cash(customer) >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, new_pet, customer)
  if new_pet != nil
    if customer_can_afford_pet(customer, new_pet) == true
      pet_price = new_pet[:price]
      add_pet_to_customer(customer, new_pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet_price)
      add_or_remove_cash(pet_shop, pet_price)
    end
  end
end
