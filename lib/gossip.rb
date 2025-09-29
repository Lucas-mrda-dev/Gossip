require 'csv'

class Gossip
  attr_accessor :author, :content, :id

  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content
  end

  def save # open the CSV file and specify the content
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all # regroup all the potins in the same array and read them
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end
end
