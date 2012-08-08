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

It is easy for you to do the summation of choices by yourself to give you a
single number.

Assuming the sum of your choices are 892
just run the following code

    892.geometric_sequence
    => [512, 256, 64, 32, 16, 8, 4]

and you will get an array with the corresponding choices.

Security with PassKey
---------------------

The current implementation allows you to "encrypt" your geometric sequence with
a very simple multiply and add modifier. You need to include the PassKey
parameter to the method in a String format stating the multiplier value as well
as addition value (e.g. "*2+43210" )

So if you want to get the encrypted value of your selection using the PassKey
"*2+43210" then run the following code

To encrypted:
    892.geometric_sequence("*2+43210",false)
    => 44994
To decrypt:
    44994.geometric_sequence("*2+43210")
    => [512, 256, 64, 32, 16, 8, 4]
*Tip: just do a .sum if u want the original number back*

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
