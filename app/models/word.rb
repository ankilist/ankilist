# frozen_string_literal: true

class Word < ApplicationRecord
  has_many :readings
  has_many :definitions
end
