require_relative "trelloclient"

trello_client = TrelloClient.new

if ARGV[0] == "list"
  trello_client.list
elsif ARGV[0] == "create"
  trello_client.create
elsif ARGV[0] == "delete"
  trello_client.delete
elsif ARGV[0] == nil
  puts "Please choose a command"
else
  puts "Unkown command or invalid arguments"
end
