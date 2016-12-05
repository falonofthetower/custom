class Reply < ApplicationRecord
  validates_presence_of :content
  validates_length_of :content, minimum: 10
  belongs_to :user
  belongs_to :post

  include ErrorHelper

  scope :latest_to_oldest, -> { order('created_at desc') }
end
