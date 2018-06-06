class Blog < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { in: 1..140 }
end