class Manager < User
  has_many :manager_client_links
  has_many :clients, through: :manager_client_links

  attr_accessible :first_name, :middle_name, :last_name, :phone, :country, :city
end