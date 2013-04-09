
module Utils # :nodoc: :all:

	def self.time_once
		start = Time.now
		yield 
		(Time.now - start).round(6)
	end


	### Math Utils module ###
	module Math

		def self.mod_exp (a, b, m)
			res = 1
			while b > 0
				if b & 1 != 0
					res = (res * a) % m
				end
				b >>= 1
				a = (a * a) % m
			end
			return res
		end
	end

end


