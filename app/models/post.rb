class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, minimum: 5
  validates_presence_of :content
  validates_length_of :content, minimum: 10
  belongs_to :user
end
