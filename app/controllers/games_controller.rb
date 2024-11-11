class GamesController < ApplicationController
  require 'open-uri'
    require 'json'

  def new
    vowels = %w[A E I O U]
    consonants = (('A'..'Z').to_a - vowels)

    @letters = vowels.sample(3) + consonants.sample(7)
  end

  def score


    @word = params[:word].upcase
    @letters = params[:letters].split

    url = "https://dictionary.lewagon.com/#{@word}"

    json = URI.open(url).read
    results = JSON.parse(json)
    @found = results["found"]

    @include = @word.each_char.all? { |char| @letters.include?(char) }

  end
end
