# frozen_string_literal: true

class Reading < ApplicationRecord
  belongs_to :word
  has_many :definitions, through: :word
end
