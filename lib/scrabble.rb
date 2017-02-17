class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
  
  def score_with_multipliers(word, letter_multipliers, word_multiplier = 1)
    multi = word.upcase.chars.each_with_index.map do |letter, i|
      point_values[letter] * letter_multipliers[i]
    end.reduce(:+)
    
    if word.length == 7
      (multi + 10) * word_multiplier
    else
      multi * word_multiplier
    end
  end
  
  def highest_scoring_word(words)
    words_sorted = words.map.sort_by { |word| score(word) }
    highest_words = words_sorted.select { |word| score(word) == score(words_sorted.last) }
    highest_words.sort_by! { |word| word.length }
    if highest_words.last.length == 7
      highest_words.last
    else
      highest_words.first
    end
  end
  
  
end
