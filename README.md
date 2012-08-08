Geometric Sequencing Filter
===========================

Geometric Sequencing Filter is a small script made to quickly tabulate a
collection of choices into a singular number. Similarly it allows you to
calculate the choices the singular number contains. For example,


Basic Introduction
------------------

If there was 4 choices,  
1. Biotechnology  
2. Computer Science  
3. Fine Arts  
4. Engineering  

And you wished to consolidate all choices into a single field, you would need to
double up each choice's index to create a geometric sequence table like so

```ruby
{ 1: "Biotechnology", 2: "Computer Science", 4: "Fine Arts", 8: "Engineering" }
```

With the above table, you are able to determine choices by the summation of the
keys.

Example:
--------

5 = Fine Arts & Biotechnology  
7 = Fine Arts, Computer Science & Biotechnology  
10 = Engineering & Computer Science  
9 = Engineering & Biotechnology  

Usage
-----

To install, its easy, just add 'geometric-sequence-filter' to your gemfile and
point it to this repository like so

```ruby
  gem 'geometric-sequence-filter', git: "git://github.com/idl3/geometric-sequencing-filter.git"
```
run a bundle install after adding it in.  
  
To test it out, go to your rails console and type:
```ruby
  require 'geometric_sequence'
```

It is easy for you to do the summation of choices by yourself to give you a
single number.  
  
Assuming the sum of your choices are 892, just run the following code

```ruby
  892.geometric_sequence
  => [512, 256, 64, 32, 16, 8, 4]

```
and you will get an array with the corresponding choices.

Security with PassKey
---------------------

The current implementation allows you to "encrypt" your geometric sequence with
a very simple multiply and add modifier. You need to include the PassKey
parameter to the method in a String format stating the multiplier value as well
as addition value (e.g. "*2+43210" )

*Warning: Only "*" and "+" are recognized, do not attempt to use "-" and "/" for now, I
will add in better coding to prevent it in future, for now just be nice and
follow the convention set out.*

So if you want to get the encrypted value of your selection using the PassKey
"*2+43210" then run the following code

To encrypted:
```ruby
  892.geometric_sequence("*2+43210",false)
  => 44994
```
To decrypt:
```ruby
  44994.geometric_sequence("*2+43210")
  => [512, 256, 64, 32, 16, 8, 4]
```
*Tip: just do a .sum if u want the original number back*

TODO:
=====
I will be adding the actual filtering configuration.
* To accept a hash list and store for reference
* To match sequenced results to the hash and return choice results as text
* To create a view helper for search form implementations

About The Project
=================
The project is something casual and I came up with this idea cause I hated having
multiple parameters in my rails app URL whenever I used a GET request, so with 1 param I can determine
multiple sorting and filtering options with a single value. Maybe its me but i
prefer my search url's to be simple. I added the PassKey because sometimes u
dont want to explicitly expose your search API to bots or external scripts (It's
still possible, but u can swap PassKeys via a global command regularly to
prevent that)

This project rocks and uses MIT-LICENSE.
