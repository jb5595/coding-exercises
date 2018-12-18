class Fibonacci
  # Implement a method that will calculate the Nth number of the Fibonacci
  # sequence (http://en.wikipedia.org/wiki/Fibonacci_number)
  def self.calculate(n)
    # Immediately returns 0 if n = 0
    if n == 0
      return 0
    end
    # initializes placeholder array to keep track of last 2 numbers generated
    last_two_fib = [0, 1]
    i = 1
    # generates each term in Fibonacci sequence until n is reached
    while (i < n )
      # Computes next value by adding last two numbers
      new = last_two_fib[0] + last_two_fib[1]
      # move previous last number to to first space in placeholder array
      last_two_fib[0] = last_two_fib[1]
      # Sets second space in array to equal to newly generated number
      last_two_fib[1] = new
      i = i +1
    end
    # Returns last number generated
    return last_two_fib.last
  end
end
