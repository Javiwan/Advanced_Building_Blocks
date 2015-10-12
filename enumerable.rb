module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		arr = []
		self.my_each do |x| 
			arr << x if yield(x)
		end
		arr
	end

	def my_all?
		self.my_each do |x|
			if yield(x) == false
				puts 'false'
				return false
			end
		end
		puts 'true'
		return true
	end

	def my_any?
		self.my_each do |x|
			return true if yield(x)
		end
		false
	end

	def my_none?
		self.my_each do |x|
			return false if yield(x)
		end
		true
	end

	def my_count(num = nil)
		count = 0
		return self.size if num == nil
		self.my_each do |x|
			count += 1 if x == num
		end
		count
	end

	def my_map
		arr = Array.new
		var = 0
		self.my_each_with_index do |x, index|
			var = yield(x)
			arr << var
		end
		arr
	end

	def my_inject(num = 0)
		total = num
		self.my_each do |x|
			total = yield(total, x)
		end
		total
	end

end

#[1,2,3,4].my_each{|x| puts x}
#[4,5,6,7].my_each_with_index {|num, index| puts num, index}
#[1,"a",2,"dog",'cat',5,6].my_select {|x| x.class == String}
#[false, false, false].my_all? {|x| x == false}
#in irb puts load './enumerable.rb'