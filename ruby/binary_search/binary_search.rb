require 'test/unit'

class BinarySearch < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1
    3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end

  def chop(element_to_find, elements)
    chop_iterative(element_to_find, elements)
    #chop_recursive(element_to_find, elements)
  end

  NOT_FOUND = -1
  def chop_iterative(what_you_are_looking_for, elements)
    slice = (0..elements.length-1)

    while there_are_numbers_in_the slice do
      middle_position = calculate_middle_position_of slice
      middle_element = elements.at middle_position

      if what_you_are_looking_for > middle_element then
        slice = greater_half_of slice 
      elsif what_you_are_looking_for < middle_element then
        slice = lower_half_of slice 
      else
        return found_element_at middle_position
      end
    end

    return NOT_FOUND 
  end



  def chop_recursive(element_to_find, elements)
    start_slice = 0
    end_slice = elements.length-1
    chop_recursion(element_to_find, elements, start_slice, end_slice)
  end

 private
    def there_are_numbers_in_the(slice)
      slice.first <= slice.last
    end
    def found_element_at(middle_position)
      middle_position
    end

    def greater_half_of(slice)
      middle_position = calculate_middle_position_of slice
      (middle_position+1..slice.last)
    end

    def lower_half_of(slice)
      middle_position = calculate_middle_position_of slice
      (slice.first..middle_position-1)
    end

    def calculate_middle_position_of(slice)
      slice_length = slice.last-slice.first
      middle_position = slice_length/2 + slice.first
    end

    def chop_recursion(element_to_find, elements, start_slice, end_slice)
      return -1 if end_slice < start_slice 
      
      slice_length = end_slice - start_slice
      middle_position = slice_length/2 + start_slice
      middle_element = elements[middle_position]
      
      if element_to_find > middle_element
        return chop_recursion(element_to_find, 
                              elements,
                              middle_position+1,
                              end_slice)
      elsif element_to_find < middle_element
        return chop_recursion(element_to_find, 
                              elements,
                              start_slice,
                              middle_position-1)
      else
        return middle_position
      end
    end
end

