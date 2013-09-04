## they use /  /  symbols
p //.class
# => Regexp

## check if string matches reg. expression -> .match() method
# returns MatchData on success
p true if /abc/.match("abc")
p true if "abc".match(/abc/)

## we can also use =~ operator
# returns index of the first occurence of string when successful, nil otherwise
p "abc" =~ /abc/
p /abc/ =~ "abc"

## any character -> .
p /./ =~ "a"
p /./ =~ "-"

## one of many -> []
p /[abcd]/ =~ "a"
p /[abcd]/ =~ "c"
p /[a-z]/ =~ "k"
p /[A-Za-z0-9]/ =~ "8"
p /[A-Za-z0-9]/ =~ "a"
p /[A-Za-z0-9]/ =~ "G"

## negating a character search -> ^ (caret) in []
p /[^a]/ =~ "abc" # => 1
p /[^a-zA-Z0-9]/ =~ "abcABC012" # => nil

## match digits -> [0-9] or \d
# \w -> any digit, character or underscore
# \s -> whitespace
## Negated versions
# \D -> any character that is not a digit
# \W -> any character that is not alfanumeric and/or underscore
# \S -> everything but whitespace
p /\d/ =~ "9"
p /\d\d\d\d/ =~ "1999"

## Grouping substrings using parentheses -> ()
# for example, string is: "04. 09. 2013."
p /(\d\d\.)\s(\d\d\.)\s(\d\d\d\d\.)$/ =~ "04. 09. 2013."
p $1 # => "04."
p $2 # => "09."
p $3 # => "2013."
# or
date = "04. 09. 2013.".match(/(\d\d\.)\s(\d\d\.)\s(\d\d\d\d\.)$/)
# if successful
whole_string = date[0]
day = date[1]
month = date[2]
year = date[3]
p day + month + year # => "04.09.2013."
# all matching groups in one array:
p date.captures # => ["04.", "09.", "2013."]

# Characters before and after the matched text
m = "Today is 04. 09. 2013. and tommorow is not.".match(/(\d\d\.)\s(\d\d\.)\s(\d\d\d\d\.)/)
p m.pre_match # => "Today is "
p m.post_match # => " and tommorow is not."

## greedy quantifiers are + and *, they eat up as much characters as possible
# it could stop after the "abc!", but it keeps on going until the end
string = "abc!def!ghi!"
match = /.+!/.match(string)
p match[0] # => "abc!def!ghi!"
# to remove 'greedyness' you put ? (question mark) after the quantifier
match = /.+?!/.match(string)
p match[0] # => "abc!"

## number of repetitions is presented with {num} expression
p "1234" =~ /\d{4}/ # => 0 (index)
p "123.432.asd" =~ /\d{3}\.\d{3}\.\w{3}$/ # => 0 (index)
# you can also use ranges
p "1" =~ /\d{1,10}/ # => 0
p "1342234" =~ /\d{1,10}/ # => 0

## beggining of line -> ^ and end of the line $ characters
p "        # this is a ruby comment" =~ /^\s*#[\s\w]*?$/ # => "0"

## modifiers appear after the //, like /  /i or /  /m
# i -> case insensitive match
# m -> . will match everything including the newline "\n" character
# x -> ignore whitespace that is not explicitly added with \s (good for comments)
date_regex = / # start of the regex
							(\d\d\.) # day match group
							\s # whitespace
							(\d\d\.) # month match group
							\s # whitespace
							(\d\d\d\d\.)$ # year match group
							/x # => comments are possible because of this x at the end

date_regex.match("04. 09. 2013.")							
p $1
p $2
p $3

## String representation of regex
reg = /abcde/
p reg.inspect # => "/abcde/"

## you can use regexes with ruby methods such as
# scan
# split
# gsub
# sub

