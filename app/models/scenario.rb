# == Schema Information
# Schema version: 20110507140343
#
# Table name: scenarios
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  module_folder :string(255)
#

class Scenario < ActiveRecord::Base
  has_many :component_results

  validates :name, :presence => true, :uniqueness => true
end
