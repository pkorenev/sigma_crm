# == Schema Information
#
# Table name: users
#
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :integer          not null, primary key
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invited_by_id          :integer
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  profile_status         :string
#  provider               :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :text
#  type                   :string
#  uid                    :string           default(""), not null
#  updated_at             :datetime         not null
#

class Manager < User
  has_many :manager_client_links
  has_many :clients, through: :manager_client_links

  attr_accessible :first_name, :middle_name, :last_name, :phone, :country, :city
end
