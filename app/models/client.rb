# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  type                   :string
#  provider               :string           default(""), not null
#  uid                    :string           default(""), not null
#  tokens                 :text
#

class Client < User
  has_many :client_tag_links
  #has_and_belongs_to_many :client_status_tags, join_table: :client_tags_link_table
  has_many :client_status_tags, through: :client_tag_links, source: :client_tag, source_type: "ClientStatusTag"
  has_many :client_group_tags, through: :client_tag_links, source: :client_tag, source_type: "ClientGroupTag"
  acts_as_taggable_on :group, :status

  #has_many :client_group_tags, join_table: :client_tags_link_table

  has_many :manager_client_links
  has_many :managers, through: :manager_client_links

  def status_label
    case self.status_list.first
      when 'Bought' then 'label-primary'
      when 'In Process' then 'label-warning'
      when 'Booked' then 'label-danger'
      else 'label-primary'
    end
  end

  def group_text
    case self.group_list.first
      when 'Ok' then 'text-navy'
      when 'VIP' then 'text-warning'
      when 'Bad' then 'text-danger'
      when 'Good' then 'text-success'
      else 'label-primary'
    end
  end

  def manager_name
    self.managers.first.full_name unless self.managers.empty?
  end
end
