require 'pry'


#### CLASS instance variable

# class Application
#   @config = {}

#   def self.set(property, value)
#     @config[property] = value
#   end

#   def self.get(property)
#     @config[property]
#   end
# end

# class ERPApp < Application
#   @config = {}
# end

# class WebApp < Application
#   @config = {}
# end


# if __FILE__ == $PROGRAM_NAME
#     ERPApp.set("name", "erp app")
#     WebApp.set("name", "web app")
#     binding.pry
#     p ERPApp.get("name")
#     p WebApp.get("name")
# end


#### EQUALITY OF Object

# class Item
#   attr_reader :item_name, :qty
#   def initialize(item_name, qty)
#       @item_name = item_name
#       @qty = qty
#   end

#   def to_s
#     "name: #{@item_name} -- quantity: #{@qty} "
#   end

#   def hash
#     @item_name.hash ^ @qty.hash
#   end

#   def eql?(other)
#     p "equal invoke!"
#     @item_name == other.item_name && @qty == other.qty
#   end
# end

# p Item.new("abcd",1)  == Item.new("abcd",1)
# p Item.new("abcd", 1).hash

# items = [Item.new("abcd", 1), Item.new("abcd", 1), Item.new("abcd", 1)]
# puts items.uniq

# def ==(other); end
# def eql?(other); self == other; end
# def hash; ^  ^ ^ ; end


### advance of array
# a, b = [12, 94]

# [[1,2,4,5], [9,8]].each { |a,b| puts "#{a} - #{b}"}

# [[1,2,4,5], [9,8]].each do |element|
#    a,b = element
#    puts "#{a} - #{b}"
# end


# def compute(ary)
#   return nil unless ary
#   ary.map { |a,b| b.nil? a : a + b }
# end

# puts compute([[4, 8], [15, 16], [4]])
# puts compute([])
# puts compute([[],[]])


#### SPLAT(*) operator
# *initial, last = %w(1 2 3)
# initial.class #=> string

# first, *middle, last = [42, 43, 44, 45, 46, 47]

# zen = *(1..42)
# str = *"Zen"

# def zen(a, b)
# 	a + b
# end
# puts zen(*[41, 1])

# [[1, 2, 3, 4], [42, 43]].each { |a, *b| puts "#{a} #{b}" }

# puts Hash[4, 8]
# puts Hash[ [[4, 8], [15, 16]] ]

# ary = [[4, 8], [15, 16], [23, 42]]
# puts Hash[*ary.flatten]

#### 4.1 The `included` Callback and the `extend` Method

# module Foo
#   def newmethod
#     puts "ruby medule instance method"
#   end
# end

# class Bar
#   include Foo
# end

# Bar.new.newmethod


#### Ruby Exceptions

# def raise_exception
#   puts "before raise"
#   raise "exception error"
#   puts "after raise, this line can't be print"
# end

# # p044inverse.rb  

# class NotInvertibleError < StandardError; end

# def inverse(x)  
#   raise NotInvertibleError, 'Argument is not numeric' unless x.is_a? Numeric
#   1.0 / x
# end  
# puts inverse(2)
# puts inverse('not a number')


# # p045handexcp.rb
# def raise_and_rescue
#   begin
#     puts 'I am before the raise.'
#     raise 'An error has occured.'
#     puts 'I am after the raise.'
#   rescue => e
#     puts "I am rescued. #{e.class}"
#   end
#   puts 'I am after the begin block.'
# end
# raise_and_rescue


# # p046excpvar.rb
# begin
#   raise 'A test exception.'
# rescue StandardError => e
#   puts e.message
#   puts e.backtrace.inspect
#   puts e.class
# end


##################################################################

## EXCEPTION CLASS  define 2 method
### #message => human-readable about details what happen
### #backtrace => array of string present call stack => the point exception was raise

### raise default call RuntimeError class

##################################################################

# # p046xreadwrite.rb
# # Open and read from a text file
# # Not that since ablock is given, file will automatically be close when the block terminates

# begin
#   File.open('p014constructs.rb', 'r') do |f1|
#     while line = f1.gets
#       puts line
#     end
#   end

#   # Create a new file and write to it
#   File.open('test.rb', 'w') do |f2|
#     # use "" for two lines of text
#     f2.puts "Create by Foobar\nThank God!"
#   end
# rescue StandardError => msg
#   puts msg
# end



# ### validation user input
# class Name
#   # Define default getter methods, but not setter methods.
#   attr_reader :first, :last
#   # When someone tries to set a first name, enforce rules about it.
#   def first=(first)
#     if first == nil or first.size == 0
#       raise ArgumentError.new('Everyone must have a first name.')
#     end
#     first = first.dup
#     first[0] = first[0].chr.capitalize
#     @first = first
#   end
#   # When someone tries to set a last name, enforce rules about it.
#   def last=(last)
#     if last == nil or last.size == 0
#       raise ArgumentError.new('Everyone must have a last name.')
#     end
#     @last = last
#   end
#   def full_name
#     "#{@first} #{@last}"
#   end
#   # Delegate to the setter methods instead of setting the instance
#   # variables directly.
#   def initialize(first, last)
#     self.first = first
#     self.last = last
#   end
# end

# binding.pry
## jacob = Name.new('Jacob', 'Berendes')
## jacob.first = 'Mary Sue'
## jacob.full_name # => "Mary Sue Berendes"
## john = Name.new('john', 'von Neumann')
## john.full_name # => "John von Neumann"
## john.first = 'john'
## john.first # => "John"
## john.first = nil
## # ArgumentError: Everyone must have a first name.
## Name.new('Kero, international football star and performance artist', nil)
## # ArgumentError: Everyone must have a last name.



# #logger.rb  
# require 'logger'  
# $LOG = Logger.new('log_file.log', 'monthly')  
# def divide(numerator, denominator)  
#   $LOG.debug("Numerator: #{numerator}, denominator #{denominator}")  
#   begin  
#     result = numerator / denominator  
#   rescue Exception => e  
#     $LOG.error "Error in division!: #{e}"  
#     result = nil  
#   end  
#   return result  
# end  
# divide(10, 2)
# divide(10, 0)

# # p047 classaccess.rb
# class Foo
#   def m1
#   end
#   protected
#     def m2
#     end
#   private
#     def m3
#     end
# end
# ca = Foo.new
# ca.m1
# ca.m2
# ca.m3



### RUBY Access control


# # p047zclassaccess.rb
# class Person
#   def initialize(age)
#     @age = age
#   end
#     def age
#       @age
#     end
  
#   def compare_age(c)
#     if c.age > age
#       "The other object's age is bigger."
#     else
#       "The other object's age is same or smaller."
#     end
#   end
#   protected :age
#   # private :age
# end

# chris = Person.new(25)
# marcos = Person.new(34)
# puts chris.compare_age(marcos)
# puts chris.age


## variable not belong to class, 
## variable is define when assign value to it
## class D do not need to define variable @n

# class C
#   def initialize
#     @n = 100
#   end
#   def increase_n
#     @n += 1
#   end
# end

# class D < C
#   def show
#     puts "value is #{@n}"
#   end
# end

# foo = D.new
# foo.increase_n
# foo.show


# ### ruby mixin
# # p061mixins.rb  
# module D  
#   def initialize(name)  
#     @name =name  
#   end  
#   def to_s  
#     @name  
#   end  
# end  
  
# module Debug  
#   include D  
#   # Methods that act as queries are often  
#   # named with a trailing ?  
#   def who_am_i?  
#     "#{self.class.name} (\##{self.object_id}): #{self.to_s}"  
#   end  
# end  
  
# class Phonograph  
#   # the include statement simply makes a reference to a named module  
#   # If that module is in a separate file, use require to drag the file in  
#   # before using include  
#   include Debug  
#   # ...  
# end  
  
# class EightTrack  
#   include Debug  
#   # ...  
# end  

# ph = Phonograph.new("West End Blues")  
# et = EightTrack.new("Real Pillow")  
# puts ph.who_am_i?  
# puts et.who_am_i?  