#advanced OOP with some metaprogramming

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

class Foo 
 attr_accessor_with_history :bar 
end 

f = Foo.new 
f.bar = 1 
f.bar = 2 
#print f.bar
#print f.bar_history # => if your code works, should be [nil,1,2]

# metaprogramming to the rescue!
 
class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
    def method_missing(method_id, *args)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        arg_currency = args[0].to_s.gsub( /s$/, '')

        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        elsif (singular_currency == "in") 
            return self / @@currencies[arg_currency]
        else
            super
        end
    end
end

class String
	def palindrome?
		var = self.downcase.gsub(/\W/, '')
		var == var.reverse
	end
end

module Enumerable
    def palindrome?
        self.entries.respond_to?(:reverse) ? self.entries == self.entries.reverse : false
    end
end



