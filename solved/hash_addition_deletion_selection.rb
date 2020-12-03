hackerrank.store(543121, 100)

hackerrank.keep_if { |k,v| k.is_a?(Integer) }

hackerrank.delete_if { |k,v| k%2 == 0 }
