def palindrome? (string)
  clean_string = string.gsub(/\W/,"").downcase
  clean_string == clean_string.reverse
end

def count_words(string)
  array = string.downcase.scan(/\b\w+\b/)
  hash = {}
  array.each do |elt|
    hash[elt] = hash.has_key?(elt) ? hash[elt] + 1 : 1
  end

  return hash
end
