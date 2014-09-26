#print
```ruby
puts "Text"
puts "Text #{variable}"
```

#function
```ruby
def h
commands
end
```
running a method
```ruby
h or h()
```
#Math
```ruby
Math.sqrt(#)
Math.sin(#)
Math.tan(#)
```

#String
```ruby
str.capitalize
str.length
str + str
string.gsub(a_string,substitute)
str[1]
```

#Class
Name is instance variable allowed to all method in class(private). 

You can always change the variables on the fly.

attr_reader   :attribute [, :attribute]...  # Creates reader methods.

attr_writer   :attribute [, :attribute]...  # Creates setter methods.

attr_accessor :attribute [, :attribute]...  # Creates both readers and writers.
```ruby
class Greeter
 	
	def initialize(name="Default")
		@name = name 
	end
	def say_hi
		puts "Hi #{@name}!"
	end
end
```

#Object
```ruby
g = Greeter.new("Pat")
g.say_hi
```

#Conditions
```ruby
if name.nil?
	blah
elsif name.nil?
	blah
else
	blah
end

```

#loop
```ruby
list.each do |item|
	blah
end
while bool-expr [do]
  body
end

until bool-expr [do]
  body
end

```

#list
```ruby
list = []
list << 4 #adding element to end
list[1]
list.delete_at(i)
list.join(", ")
```
#hash
```ruby
hash = {:key => "value"}
hash[:key] = "value" #:key doesnt need quotes around it
hash.delete(key)
```
#main function
```ruby
if __FILE__ == $0
```

#Psuedo variables
```ruby
self     # the receiver of the current method
nil      # the sole instance of the Class NilClass (falsey)
true     # the sole instance of the Class TrueClass
false    # the sole instance of the Class FalseClass
__FILE__ # the current source file name.
__LINE__ # the current line number in the source file.
$DEBUG     # The boolean status of the -d switch.
$FILENAME  # Current input file from ARGF. Same as ARGF.filename.
$LOAD_PATH # Load path for scripts and binary modules by load or require.
$stderr    # The current standard error output.
$stdin     # The current standard input.
$stdout    # The current standard output.
$VERBOSE   # The verbose flag, which is set by the -v switch.
$global_variable
@@class_variable
@instance_variable
CONSTANT
::TOP_LEVEL_CONSTANT
OtherClass::CONSTANT
local_variable
```

#Reserved keywords
```ruby
alias   and     BEGIN   begin   break   case    class   def     defined?
do      else    elsif   END     end     ensure  false   for     if
in      module  next    nil     not     or      redo    rescue  retry
return  self    super   then    true    undef   unless  until   when
while   yield
```

#Files
```ruby
path = File.join(p1, p2, ... pN) # => "p1/p2/.../pN"

f = File.new("path", "r") # don't use this. Use the block form
File.open("path")      { |f| f.read }
File.open("path", "r") { |f| f.read }
File.open("path", "w") { |f| f.puts "woot" }
File.open("iso-8859-1.txt", "r:iso-8859-1") { |f| ... } # 1.9 open with encoding
File.size("path")  # => 42
File.mtime("path") # => Yesterday

IO.foreach("path") { |line| puts line if line =~ /woot/ }
lines = IO.readlines("path")
"r"  R/O, start of file (default mode).
"r+" R/W, start of file.
"w" W/O, truncates or creates.
"w+" R/W, truncates or creates.
"a" W/O, end of file or creates.
"a+" R/W, end of file or creates.
"b" Binary file mode, in addition to above. DOS/Windows only.
```