require "faraday"

# response = Faraday.get 'https://api.trello.com/1/boards/LFZoaH46/cards?fields=name,url&key=530770590241f292e896f80818f68e1d&token=513b5b9619d4777c692622e3728bb2dc9d3d185bc5fb587fd00506ec31a9dadd'
# not using the token because public board

response = Faraday.get 'https://api.trello.com/1/boards/LFZoaH46/cards?fields=name,url'

# puts response.body
json_cards = response.body

require "json"

cards = JSON.parse(json_cards)

infos = []

cards.each do |card|
  infos += [card["id"] + ": " + card["name"]]
end

if ARGV[0] == "list"
  puts infos
elsif ARGV[0] == "create"
  Faraday.post('https://api.trello.com/1/cards', { :name => 'Pas coder tant',
  :desc => 'Encore une description',
  :idList => '5bb39ee0029f335fb88aa2a9',
  :key => '530770590241f292e896f80818f68e1d',
  :token => '513b5b9619d4777c692622e3728bb2dc9d3d185bc5fb587fd00506ec31a9dadd' })
else
  puts "error"
end
