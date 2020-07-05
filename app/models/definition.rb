# frozen_string_literal: true

class Definition < ApplicationRecord
  belongs_to :word
  has_many :readings, through: :word
end
