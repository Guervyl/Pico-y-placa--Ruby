#file: pico_y_placa.rb

class PicoYPlaca
	public
  attr_reader :days, :min, :hour, :day, :number, :time
	
  def initialize(n, day, t)
  
  	#Array to check if the day inserted is a valid day
  	@days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  	
  	self.day = day
  	self.time = t
    self.number = n
  end
  
  def day=(day)
  	checkDay(day)
  	@day = day.capitalize
  end
  
  def number=(n)
  	checkNumber(n)
  	@number = n
  end
  
  def time=(t)
  	checkTime(t)
  	initMinutesAndHours
  	@time = t
  end
  
  def lastDigit
  	checkNumber(number)
  	number[6].to_i
  end
  
  def in_time?
  	checkTime(time)
  	(hour >= 7 && hour <= 8) || (hour == 9 && min <= 30) || (hour >= 16 && hour <= 18) || (hour == 19 && min <= 30)
  end

  def is_allow?
  	checkDay(day)
  	
		return false if in_time? && (day == days[0] && (lastDigit == 1 || lastDigit == 2))
		return false if in_time? && (day == days[1] && (lastDigit == 3 || lastDigit == 4))
		return false if in_time? && (day == days[2] && (lastDigit == 5 || lastDigit == 6))
		return false if in_time? && (day == days[3] && (lastDigit == 7 || lastDigit == 8))
		return false if in_time? && (day == days[4] && (lastDigit == 9 || lastDigit == 0))
		
		return true
	end
	
	private
	
	def checkNumber(number)
		#Check the types. They must be Sting or raise an ArgumentError exception
  	raise ArgumentError, "The plate number must be a String", caller if number.class != String
  	raise ArgumentError, "The plate number must match the pattern", caller if (number =~ /^[A-Z]{3}[0-9]{4}$/) != 0
	end
	
	def checkDay(day)
		raise ArgumentError, "Day must be a String", caller if day.class != String
		raise ArgumentError, "Unknown day", caller if !(days.include? day.capitalize)
	end
	
	def checkTime(time)
		raise ArgumentError, "The time must be a String", caller if time.class != String
		
		@patterResult = time.scan /^([0][1-9]|[1][0-9]|[2][0-4]):([0]\d|[1-5]\d)$/
		
		raise ArgumentError, "The time must match the pattern", caller if @patterResult.size != 1
	end
	
	def initMinutesAndHours
		@hour = @patterResult[0][0].to_i
		@min = @patterResult[0][1].to_i
	end
end


















