##
# Metaprogramming *Numeric* +class+
# Usage:
#
#
#   # Convert dollars to yen
#   p 5.yen
#
#   # Convert dollars to euro
#   p 10.euro
class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}

    ##
    # Override of +method_missing+ method
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



