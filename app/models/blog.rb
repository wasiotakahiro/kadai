class Blog < ApplicationRecord
  belongs_to :company
    validates :title, presence: true
    validates :content, length: { in: 1..140 }
end
