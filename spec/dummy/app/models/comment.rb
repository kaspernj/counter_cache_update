class Comment < ApplicationRecord
  belongs_to :resource, counter_cache: true, polymorphic: true
end
