# frozen_string_literal: true

class UploadsController < ApplicationController
  def index; end

  # TODO:
  # 1. Clean up / refactor this code
  # 2. Add tests
  # 3. Build out JS functionality for downloading the file
  # 4. Update JS to base64 encode the file instead of using form data
  def create
    file = params[:file]
    generated_file = Tempfile.new("generated.tsv")
    generated_file.binmode
    File.readlines(file).each do |word|
      word = word.chomp

      definition = Definition.joins(word: :readings).where(readings: { reading: word }).first
      file_definition = "#{definition.part_of_speech} #{definition.definition}"
      generated_file.write(file_definition)
      generated_file.write("\t")

      primary_reading = Reading.joins(:word).where(primary: true, word_id: definition.word_id).first.reading
      generated_file.write(primary_reading)
      generated_file.write("\t")

      primary_kana = Reading.joins(:word).where(primary_kana: true, word_id: definition.word_id).first.reading
      generated_file.write(primary_kana)
      generated_file.write("\n")
    end

    generated_file.rewind
    encoded_file = Base64.encode64(generated_file.read)

    render json: { file: encoded_file }, status: 200
  end
end
