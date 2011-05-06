# == Schema Information
# Schema version: 20110506020452
#
# Table name: components
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  class_name       :string(255)
#  product_name     :string(255)
#  input_type_id    :integer
#  output_type_id   :integer
#  canvas_component :string(255)
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Component < ActiveRecord::Base
  belongs_to :input_type, :class_name => 'ModelType'
  belongs_to :output_type, :class_name => 'ModelType'
end
