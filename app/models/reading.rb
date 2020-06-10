# frozen_string_literal: true

class Reading < ApplicationRecord
  has_many :definitions
end
