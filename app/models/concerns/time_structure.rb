require_relative '../interval_time'

module TimeStructure
	extend ActiveSupport::Concern

# calculate how many times each movie can play in a day (count)
  def get_max_showtime_count_per_day(total_daily_minutes, additional_interval_time, movie_duration)

    count = 1
    default_total_movie_runtime = movie_duration + additional_interval_time
    default_first_movie_runtime = movie_duration + IntervalTime::OPENING_TIME + additional_interval_time

    while true

      total_daily_minutes -= default_total_movie_runtime

      if total_daily_minutes < default_first_movie_runtime

        break

      end
      count += 1

    end
    count

  end

#   puts get_max_showtime_count_per_day(720, 35, 134) = 4
#   puts get_max_showtime_count_per_day(720, 35, 86) = 5

  # Each movie should start at easy to read times (eg 10:00, 10:05, 10:10)
  def get_easy_read_time(time)

    minute = Time.at(time).strftime("%M").to_i
    diff = minute % 5
    time - diff.minutes

  end

#    puts get_easy_read_time(1718967600)
#    1718967480


# convert showtime from epoch to human readable date - using GMT time zone
  def get_formatted_start_end_time(movie_start_time, movie_duration)

    Time.zone = "GMT"

    start_time = Time.zone.at(movie_start_time).strftime("%l:%M %p")
    end_time = movie_start_time + movie_duration.minutes
    end_time = Time.zone.at(end_time).strftime("%l:%M %p")

    {start_hour: start_time, end_hour: end_time}

  end

    # puts get_formatted_start_end_time(1718967600, 134)

    # {:start_hour=>"11:00 AM", :end_hour=>" 1:14 PM"}

end
