class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.
    @actor = Actor.second
    @actor_movies = @actor.movies.sort_by { |k| k["year"]}

    @most_recent_movie_for_second_actor = @actor_movies.last.title
  end

  def question_2
    # Who directed the longest movie on the list?

    # Your Ruby goes here.
    @longest_movie_duration = Movie.order("duration DESC").first.duration
    @director_of_longest_movie = Movie.order("duration DESC").first.director.name
  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.
    number_of_movies_per_director = Movie.group(:director_id).count

    max_movies_by_a_director = number_of_movies_per_director.values.max

    directors_for_max_movie_count = number_of_movies_per_director.select{|k,v| v == max_movies_by_a_director }.keys

    #for each director id, list their name
    dir_loop_counter = 0
    directors_for_max_movie_count.each do |the_director|
      if dir_loop_counter == 0 then
        @directors_names = Director.find(the_director).name
      else
        @directors_names = @directors_names + " & " + Director.find(the_director).name
      end
      dir_loop_counter = dir_loop_counter + 1
    end

    @director_with_the_most_movies = @directors_names

  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)
    number_of_movies_per_actor = Role.group(:actor_id).count

    max_movies_by_actor = number_of_movies_per_actor.values.max

    actors_for_max_movie_count = number_of_movies_per_actor.select{|k,v| v == max_movies_by_actor }.keys

    actor_loop_counter = 0
    actors_for_max_movie_count.each do |the_actor|
      if actor_loop_counter == 0 then
        @actors_names = Actor.find(the_actor).name
      else
        @actors_names = @actors_names + " & " + Actor.find(the_actor).name
      end
      actor_loop_counter = actor_loop_counter + 1
    end

    # Your Ruby goes here.

    @actor_with_the_most_movies = @actors_names
  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
