class Manager < User
  has_many :manager_client_links
  has_many :clients, through: :manager_client_links
end