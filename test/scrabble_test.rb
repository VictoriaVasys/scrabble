# gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end
  
  def test_it_can_implement_letter_multipliers_for_scoring
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1]) 
  end
  
  def test_it_can_implement_word_multipliers_for_scoring
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end
  
  def test_it_can_implement_7_letter_word_multiplier_for_scoring
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
  
  def test_it_can_find_highest_scoring_word
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end
  
  def test_it_can_find_highest_scoring_word_with_tie
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
  end
  
  def test_it_can_find_highest_scoring_word_with_tie_and_7_letter_word
    game = Scrabble.new
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])
  end
  
end
