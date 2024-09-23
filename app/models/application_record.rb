class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  scope :recents, -> { order(created_at: :desc) }
end
