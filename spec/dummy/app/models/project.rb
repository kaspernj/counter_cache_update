# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments, as: :resource, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
