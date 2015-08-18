class Book < ActiveRecord::Base
  attr_accessible *attribute_names

  has_one :reward, as: :rewardable

end
