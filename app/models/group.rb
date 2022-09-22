class Group < ApplicationRecord
    has_many :articles
    has_and_belongs_to_many :users
end
