def anagram_factorial?(str1, str2)
  base = str1.split("")
  compare = str2.split("")

  anagrams = compare.permutation.to_a
  anagrams.include?(base)
end

def second_anagram?(str1,str2)
  base = str1.split("")
  compare = str2.split("")

  while (char = base.shift)
    idx = compare.index(char)
    return false if idx.nil?
    compare.delete_at(idx)
  end
  compare.empty?
end

def third_anagram?(str1, str2)
  arr1 = str1.split('') # n
  arr2 = str2.split('') #n
  arr1.sort! #n * log(n)
  arr2.sort! #n * log(n)
  arr2 = arr1 # n


end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char. do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2

end
