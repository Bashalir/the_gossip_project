class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { in: 6..20 }
  validates :content, presence: true
  belongs_to :user
  has_and_belongs_to_many :tags
end
