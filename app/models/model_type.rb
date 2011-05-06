# == Schema Information
# Schema version: 20110505234155
#
# Table name: model_types
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class ModelType < ActiveRecord::Base
  validates :name, :presence => true,
  :length => { :maximum => 50 },
  :uniqueness => { :case_sensitive => false}
end
