# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project, counter_cache: true

  has_many :comments, as: :resource
end
