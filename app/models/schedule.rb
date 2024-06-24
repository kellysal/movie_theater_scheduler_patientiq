# build out theater schedule using theater time calculations

include HoursOfOperation
include TimeStructure

require_relative 'interval_time'

class Schedule

  attr_accessor :weekday_showtimes, :weekend_showtimes, :movie_duration

  def initialize(weekday_showtimes: [], weekend_showtimes: [], movie_duration: 0)
    @movie_duration = movie_duration
    @weekday_showtimes = build_weekday_showtime_list
    @weekend_showtimes = build_weekend_showtime_list
  end

  def build_weekday_showtime_list
    opening_hour = get_weekday_hours[0]
    closing_hour = get_weekday_hours[1]
    get_hours_list(opening_hour,closing_hour)
  end

  def build_weekend_showtime_list
    opening_hour = get_weekend_hours[0]
    closing_hour = get_weekend_hours[1]
    get_hours_list(opening_hour,closing_hour)
  end

  private 

  def get_hours_list(opening_hour, closing_hour)

    default_movie_operation_time = IntervalTime::PREPARE_TIME + IntervalTime::PREVIEW_TIME # 35 minutes

    total_working_minute = (closing_hour - opening_hour) / 60 # 720 minutes

    max_showtime_count_per_day = get_max_showtime_count_per_day(total_working_minute, default_movie_operation_time, @movie_duration)
    hours_result = []
    previous_showtime = 0

    for i in (max_showtime_count_per_day).downto(1)
      if i == max_showtime_count_per_day # example 4 == 4
       
        #calculate the start of the last showtime per day using movie duration and closing time
        start_showtime = closing_hour - @movie_duration.minutes # -134 minutes and 1719183600 seconds

      else
        #calculate the other start times using the interval time + movie duration
        start_showtime_diff = default_movie_operation_time + @movie_duration # 35 + 134
        start_showtime = previous_showtime - start_showtime_diff.minutes # -304 minutes and 1719183600 seconds

      end
      start_showtime = get_easy_read_time(start_showtime)
      hours_result << get_formatted_start_end_time(start_showtime, @movie_duration) # [{:start_hour=>" 8:45 PM", :end_hour=>"10:59 PM"}]

      #calculate previous_showtime to get the next showtime
      previous_showtime = start_showtime # -135 minutes and 1719183600 seconds

      
    end
    hours_result.reverse

  end

end