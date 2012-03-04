def sort_letters(word)
  return word.downcase.chars.sort.join
end

def insert_word(word, array)
  array.each do |a|
    a.each do |w|
      if sort_letters(w) == sort_letters(word)
        #found anagram
        a.push(word)
        return array
      end
    end
  end

  return array.push([word])
end

def combine_anagrams(words)
  result = []
  words.each do |word|
    result = insert_word(word, result)
  end
  return result
end
