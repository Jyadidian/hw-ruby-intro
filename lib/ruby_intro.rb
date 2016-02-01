# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  if arr.empty?
    0
  else
    sum = 0
    arr.each {|x| sum += x}
    sum
  end
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.empty?
    0
  elsif arr.length == 1
    arr[0]
  else
    arr.sort! {|x,y| y <=> x}
    arr[0] + arr[1] 
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.empty? || arr.length == 1
    false
  else
    currElem = arr.pop
    arr.each {|x| return true if currElem + x == n}
    return sum_to_n?(arr, n)
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  "Hello, " << name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  # return false if s.empty?
  
  alphabet = "a".."z"
  vowels = ["a","e","i","o","u"]
  
  return false if s.empty?
  firstLetter = s[0].downcase
  
  if alphabet.include?(firstLetter) && !vowels.include?(firstLetter)
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if !s.is_a? String
    return false
  end
  
  if s.empty?
    return false
  end
  
  arr = s.split("")
  arr.each do |x|
    if x != "0" && x != "1"
      return false
    end
  end
  
  length = s.length
  last = s[length-1]
  secondToLast = s[length-2]
  
  if last == "1" || secondToLast == "1"
    return false
  end
  
  return true
  
end

# Part 3

class BookInStock
# YOUR CODE HERE

  attr_accessor :isbn, :price
  
  def initialize(isbn, price)
    
    if !isbn.is_a? String
      raise ArgumentError.new("ISBN number must be a String!")
    elsif isbn.empty?
      raise ArgumentError.new("ISBN cannot be an empty String!")
    else
      @isbn = isbn
    end
    
    if price <= 0
      raise ArgumentError.new("Price must be greater than $0.00!")
    else
      @price = price
    end
    
  end
  
  def price_as_string
    price_string = @price.to_s
    string_length = price_string.length
    
    if price_string[string_length-3] == "."
      return "$#{price_string}"
    elsif price_string[string_length-2] == "."
      return "$#{price_string}0"
    else
      return "$#{price_string}.00"
    end
  end
  
end
