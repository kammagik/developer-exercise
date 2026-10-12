class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    items = str.split(" ")

    items.map! do |item|
      if item.length > 4
        regx = (/[\p{Punct}]+/)
        punctuation = item.match(regx)
        if item == item.capitalize
          item = punctuation ? "Marklar#{punctuation}" : "Marklar"
        else
          item = punctuation ? "marklar#{punctuation}" : "marklar"
        end
      else
        item
      end
    end
    items.join(" ")
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    arr = []
    newArr = []
    current = nil
    previous = nil
    sum = 0
    
    0.step(nth) { |v| arr.push(v) }
    
    arr.each_with_index.map do |v, i|
      if i == 0
        previous = v
        current = v
        newArr.push(current)
      elsif i == 1
        old_current = current
        current = previous + v
        previous = old_current
        newArr.push(current)
      else
        old_current = current
        current = previous + current
        previous = old_current
        newArr.push(current)
      end
    end
    newArr.each do |v|
      if v.even?
        sum += v
      end
    end
    sum
  end

end
