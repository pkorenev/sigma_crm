class Reward < ActiveRecord::Base
  belongs_to :rewardable, polymorphic: true

  def self.seed_rewards
    authors = []
    books = []
    50.times do |i|
      a = Author.new
      a.name = FFaker::Lorem.word()
      r = Reward.new
      r.name = FFaker::Lorem.word
      a.reward = r
      authors << a

      b = Book.new
      b.name = FFaker::Lorem.word
      br = Reward.new
      br.name = FFaker::Lorem.word
      b.reward = br
      books << b
    end

    authors.map &:save
    books.map &:save
  end
end
