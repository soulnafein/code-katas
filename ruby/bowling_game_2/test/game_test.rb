require_relative './test_helper'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_gutter_game
    roll(0, times: 20)

    assert_equal 0, @game.score
  end

  def test_rolling_all_ones
    roll(1, times: 20)

    assert_equal 20, @game.score
  end

  def test_rolling_one_spare
    roll(5, 5, 3)
    roll(0, times: 17)

    assert_equal 16, @game.score
  end

  def test_rolling_one_strike
    roll(10, 3, 4)
    roll(0, times: 16)

    assert_equal 24, @game.score
  end

  def test_perfect_game
    roll(10, times: 12)

    assert_equal 300, @game.score
  end

  def test_spare_in_last_frame
    roll(0, times: 18)
    roll(7, 3, 5)

    assert_equal 15, @game.score
  end

  def test_strike_in_last_frame
    roll(0, times: 18)
    roll(10, 3, 5)

    assert_equal 18, @game.score
  end

  def roll(*rolls, times: 1)
    times.times do
      rolls.each do |pins|
        @game.roll(pins)
      end
    end
  end
end
