require './pico_y_placa'
require 'test/unit'

class TestPicoYPlaca < Test::Unit::TestCase

	#test if itsn't on Pico y placa time
	def testTimeFalse
		assert_equal(false, PicoYPlaca.new("PPP8745", "monday", "20:49").in_time?)
	end
	
	#test if it's on Pico y placa time
	def testTimeTrue
		assert_equal(true, PicoYPlaca.new("PPP8745", "monday", "16:30").in_time?)
	end
	
	def testLastDigit
		assert_equal(1, PicoYPlaca.new("PPP8741", "monday", "16:30").lastDigit)
	end
	
	def testLastDigit2
		assert_equal(5, PicoYPlaca.new("PPP8745", "monday", "16:30").lastDigit)
	end
	
	def testIsAllow
		assert_equal(true, PicoYPlaca.new("PPP8741", "monday", "06:00").is_allow?)
	end
	
	def testIsAllow2
		assert_equal(false, PicoYPlaca.new("PPP8741", "monday", "18:25").is_allow?)
	end
	
	def testIsAllow3
		assert_equal(false, PicoYPlaca.new("PPP8744", "tuesday", "09:25").is_allow?)
	end
	
	def testNumberType
		assert_raise(ArgumentError){PicoYPlaca.new(256849, "tuesday", "09:25")}
	end
	
	def testNumberType2
		assert_raise(ArgumentError){PicoYPlaca.new(256849.6, "tuesday", "09:25")}
	end
	
	def testNumberType3
		assert_nothing_raised(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "09:25")}
	end
	
	def testNumberType4
		assert_raise(ArgumentError){PicoYPlaca.new("d45po7", "tuesday", "09:25")}
	end
	
	def testNumberType5
		assert_raise(ArgumentError){PicoYPlaca.new("ppp4587", "tuesday", "09:25")}
	end
	
	def testDayType
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesda", "09:25")}
	end
	
	def testDayType1
		assert_nothing_raised(ArgumentError){PicoYPlaca.new("PPP8744", "tuEsdaY", "09:25")}
	end
	
	def testTimeType
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "0:25")}
	end
	
	def testTimeType1
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "00:25")}
	end
	
	def testTimeType2
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "-1:25")}
	end
	
	def testTimeType3
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "80:25")}
	end
	
	def testTimeType4
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesda", "0025")}
	end
	
	def testTimeType5
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "0:25")}
	end
	
	def testTimeType6
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "05:-25")}
	end
	
	def testTimeType7
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "00:-5")}
	end
	
	def testTimeType8
		assert_raise(ArgumentError){PicoYPlaca.new("PPP8744", "tuesday", "00\d25")}
	end
	
	def testMinute
		assert_equal(25, PicoYPlaca.new("PPP8744", "tuesday", "15:25").min)
	end
	
	def testMinute2
		assert_equal(5, PicoYPlaca.new("PPP8744", "tuesday", "15:05").min)
	end
	
	def testHour
		assert_equal(15, PicoYPlaca.new("PPP8744", "tuesday", "15:05").hour)
	end
	
	def testHour2
		assert_equal(9, PicoYPlaca.new("PPP8744", "tuesday", "09:05").hour)
	end
end










