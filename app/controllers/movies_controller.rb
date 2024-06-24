class MoviesController < ApplicationController

  # build movie_index with json params
  def create_movies
    movies_params = params[:_json].as_json #[{"title"=>"There’s Something About Mary", "year"=>1998, "rating"=>"R", "duration"=>134}
    movie_index = []

    movies_params.each do |m|
      title = m["title"]
      year = m["year"]
      rating = m["rating"]
      duration = m["duration"]

      if title.present? and duration.to_i > 0
       movie = Movie.new(title, year, rating, duration)
      end

      movie_index << movie if movie.present? and movie.title.present? #[#<Movie:0x0000000113209ce8 @duration=134, @rating="R", @title="There’s Something About Mary", @year=1998>]

    end
    
    return [] if movie_index.nil? || movie_index.size == 0
    start_schedule(movie_index)

  end

  private

  # build movie_index with showtime calculations / theater schedule
  def start_schedule(movie_index)
    movie_result = []

    movie_index.each do |movie|
      schedule = Schedule.new(movie_duration: movie.duration)

      movies_index = {
        "movie_title": movie.title,
        "movie_year": movie.year,
        "movie_rating": movie.rating,
        "weekday_showtimes": schedule.weekday_showtimes,
        "weekend_showtimes": schedule.weekend_showtimes,
      }

      movie_result << movies_index

    end

    movie_index_output(movie_result)

  end

  # display the movie lists with calculated showtimes
  def movie_index_output(json)

    puts "+------------------------+"
    puts "| Movie Theater Schedule |"
    puts "+------------------------+"

    json.each do |item|
      puts "\n"
      puts item[:movie_title]

      puts "+------------------------+"
      puts "|   Monday - Thursday    |"
      puts "+------------------------+"

      item[:weekday_showtimes].each do |hour|
        hour = hour.to_h
        puts "#{hour[:start_hour]} - #{hour[:end_hour]}"
      end

      puts "+------------------------+"
      puts "|    Friday - Sunday     |"
      puts "+------------------------+"

      item[:weekend_showtimes].each do |hour|
        hour = hour.to_h
        puts "#{hour[:start_hour]} - #{hour[:end_hour]}"
      end

      puts "\n"

    end
  end
  
end