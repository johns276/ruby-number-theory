RubyNumberTheory
================

A number theory library written in pure Ruby. 

It aims to be easy to use (and possibly fast), while keeping its code as simple as possible.

Obtaining
---------

The library is available as a [gem](https://rubygems.org/gems/number-theory)
```
sudo gem install number-theory
```

You can also clone it with git
```
git clone https://github.com/ALTree/ruby-number-theory.git
```

You will need to install the NArray gem, since number-theory requires it:
```
sudo gem install narray
```

Usage
-----

The library consist of three main modules:

* **Primes**: with methods for primality test, factorization, ..
* **Divisors**: with methods related to integer division
* **Utils**: for various utility methods

All of them are incapsulated into the main **NumberTheory** module, wich provide namespaces separation.

A minimal working script, solving [problem 3](http://projecteuler.net/problem=3) of the nice [Project Euler](http://projecteuler.net/).

```ruby
require 'number-theory'
include NumberTheory

puts Primes::factor(600851475143).keys.max   # 6857 
```

Follows a (nearly) complete list of the methods provided by the library.

### Primes

* Primality test
```ruby
>> Primes::prime?(173)
  => true
```
```ruby
>> Primes::prime?(416064700201658306196320137931)
  => true
```

* List of primes
```ruby
# Under 30
>> Primes::primes_list(30)
=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```
```ruby
# Between 60 and 100
>> Primes::primes_list(60, 100)
=> [61, 67, 71, 73, 79, 83, 89, 97]
```

* Integer factorization
```ruby
# Factors, and their multiplicity
>> Primes::factor(60)
=> {2=>2, 3=>1, 5=>1} 
```
```ruby
>> Primes::factor(13372101884243077687)
=> {4093082899=>1, 3267000013=>1}
```
```ruby
# With a limit on the size of the factors
>> Primes::factor(1690, {:limit => 12})
=> {2=>1, 5=>1, 169=>1} # no factor greater than 12 is returned
```

* The nth prime number
```ruby
>> Primes::nthprime(10)
=> 29
```

* The value of pi(n), the number of primes smaller than n
```ruby
>> Primes::primepi(1000)
=> 168
```

* Previous and Next prime of a number
```ruby
>> Primes::prevprime(1000)
=> 997
```
```ruby
>> Primes::nextprime(1000)
=> 1009
```

* A random prime between *low* and *high*
```ruby
>> Primes::randprime(900, 1000)
=> 971
```

* The primorial of n
```ruby
# The product of the first 10 prime numbers
>> Primes::primorial(10)
=> 6469693230
```


### Divisors

* Factors multiplicity
```ruby
# Returns the greatest k such that 2^k divides 1200
>> Divisors::multiplicity(1200, 2)
=> 4
```

* List of divisors
```ruby
>> Divisors::divisors(60)
=> [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60]
```

* Divisor count function
```ruby
# Returns the number of divisors of 60
>> Divisors::divcount(60)
=> 12
```

* Sigma divisor function
```ruby
# Returns sigma_k(n); the sum of the k-th powers of the divisors of n.
>> Divisors::divisor_sigma(60, 2)
=> 5460
```

* Perfect number?
```ruby
>> Divisors::perfect?(28)
=> true
```

* Euler phi function
```ruby
# Returns the number of integers coprime to 60
>> Divisors::euler_phi(30)
=> 8
```

### Utils

* Modular inverse
```ruby
# Returns the modular inverse of 120 (mod 107),
>> Utils::mod_inv(120, 107)
=> 33 # because 120 * 33 == 1 (mod 107)
```

* Modular exponentiation
```ruby
# Returns 1777^1855 (mod 10^12)
>> Utils::mod_exp(1777, 1855, 10**12)
=> 630447576593
```
```ruby
# Negative exponents allowed
>> Utils::mod_exp(13, -17, 1000)
=> 597
```

Tests
---------

All the methods implemented in the library came with unit tests. 

One can run all the tests using *rake*. In the main directory of the library:

    rake test:run

This command will run all the tests in the *test* directory of the library.


Contributing
------------

RubyNumberTheory is in **ALPHA STATUS**. Contributions are welcome!

Here's some ideas (maybe also a roadmap for possible future versions of the library):

* **Extend / modify the factorization method to make it faster.** Currently implemented: trial division + Pollard's rho + Pollard's p-1, 
Lenstra's elliptic curve factorization method would be very nice.

* **Extend the Divisors Module**. Squares and square-free recognition, Legendre symbol, Jacobi symbol, Mobius function..

* **A Combinatorics Module**. Generator for partitions, permutations, ..

* **A Congruence Module**. Congruences solver, Chinese Remainder Theorem, ..

License
------------

RubyNumberTheory is released under GNU General Public Licens (see LICENSE).


