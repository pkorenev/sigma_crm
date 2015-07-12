class Company < ActiveRecord::Base
  has_many :manager_company_links
  has_many :managers, through: :manager_company_links

  attr_accessible(*attribute_names)
end
