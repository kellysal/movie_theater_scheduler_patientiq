#calculate hours of operation for the theater - convert to epoch
require 'date'

module HoursOfOperation
	extend ActiveSupport::Concern
	
	# calculate opening and closing hours - weekday
	def get_weekday_hours()
		opening_hour = DateTime.parse("11:00:00 AM").to_time.to_i
		closing_hour = DateTime.parse("11:00:00 PM").to_time.to_i
		[opening_hour, closing_hour]
	end
	# [1719140400, 1719183600]

	# calculate opening and closing hours - weekend
	def get_weekend_hours()
		opening_hour = DateTime.parse("10:30:00 AM").to_time.to_i
		closing_hour = DateTime.parse("12:00:00 AM").to_time.to_i + 1.day
		[opening_hour, closing_hour]
	end
	# [1719138600, 1 day and 1719100800 seconds]

end