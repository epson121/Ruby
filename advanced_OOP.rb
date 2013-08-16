##
# advanced OOP with some metaprogramming
#
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"

    class_eval %{     
        def #{attr_name}=val
          @#{attr_name} = val
          @#{attr_name}_history = [nil] if @#{attr_name}_history.nil?
          @#{attr_name}_history.push(val)
        end
        }
  end
end

##
# Usage:
#   f = Foo.new 
#   f.bar = 1 
#   f.bar = 2 
#   print f.bar
#   print f.bar_history 
#   => [nil,1,2]
class Foo 
 attr_accessor_with_history :bar 
end 

##
# Metaprogramming String class
class String
    ##
    # defines palindrome method
	def palindrome?
		var = self.downcase.gsub(/\W/, '')
		var == var.reverse
	end
end


##
# Metaprogramming Enumerable class
module Enumerable
    ##
    # Defines palindrome method
    def palindrome?
        self.entries.respond_to?(:reverse) ? self.entries == self.entries.reverse : false
    end
end



