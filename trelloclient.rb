require "json"
require "faraday"
require_relative "secrets"

class TrelloClient

  def list
    response = Faraday.get 'https://api.trello.com/1/boards/LFZoaH46/cards?fields=name,url'

    json_cards = response.body

    cards = JSON.parse(json_cards)

    infos = []

    cards.each do |card|
      infos += [card["id"] + ": " + card["name"]]
    end

    puts infos
  end

  def create
    Faraday.post('https://api.trello.com/1/cards', { :name => ARGV[1],
    :key => API_KEY_TRELLO,
    :token => TOKEN_TRELLO })
  end

  def delete
    if Faraday.delete('https://api.trello.com/1/cards/' + ARGV[1], {:key => API_KEY_TRELLO,
      :token => TOKEN_TRELLO }).success?
    else
      puts "We couldn't find any card with the id "+ ARGV[1] + "\n Here is the list of existing cards:\n"
      infos.each do |info|
        puts info
      end
    end
  end

end
