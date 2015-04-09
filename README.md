## Exercise 1 - Time String

#### Requirements:
Prove that you can correctly implement a function where
* Input - a bunch of times, minutes and seconds, formatted as a single string like: "12:32 34:01 15:23 9:27 55:22 25:56"
* Output - the sum of the times, hours, minutes, and seconds, formatted as a single string like: "2:32:41"

#### Reflection:

This challenge was a lot more interesting than I imagined upon first reading through it.  I wanted to maintain a solid handling of edge cases, so I wrote out tests for standard inputs, invalid inputs, and edge cases.  For example, I wanted the following to happen:
* Handle "5" as 5 seconds
* Raise error for a time input without full seconds, ex. "12:4"
* Handle "67:89" same as "1:08:19"

The general program pseudocode is as follows:
1. take input string and split with space delimiter to get array of times
2. iterate through each time in the array
3. ensure time is valid format such as SS, M:SS, MM:SS, or H:MM:SS
4. convert each time to seconds
5. sum up all of the seconds
6. convert the seconds back into time format

One tricky problem was converting the seconds back into time.  I did this by calculating the hours, minutes, and seconds (using division and then remainders), and then concatinating them together with properly justified (leading zeroes) and with colons.  I had to then write a nasty regex to remove the leading zeroes and any unnecessary colons.

I tried to properly follow most of the guidelines.  This challenge could have been a lot less interesting if I had used the strftime library, which would parse the time strings and allow for easy addition and output rendering.  But that would not be fun or challenging so I avoided using external libraries.