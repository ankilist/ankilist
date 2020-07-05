# frozen_string_literal: true

count = 0
doc = Nokogiri::XML(File.open("#{Rails.root}/JMdict_e"))

doc.search('//entry').each do |entry|
  word = Word.create!

  primary_reading = nil
  definition_part_of_speech = nil
  definition_misc_info = nil
  readings = []

  # Weird case on line 534
  kebs = entry.elements.search('./keb')
  if kebs.present?
    primary_reading = kebs.first
    readings << Reading.create!(reading: primary_reading.content, primary: true, word_id: word.id)

    kebs[1..].each do |non_primary_reading|
      readings << Reading.create!(reading: non_primary_reading.content, primary: false, word_id: word.id)
    end
  end

  rebs = entry.elements.search('./reb')
  is_primary_reading = primary_reading.nil? && rebs.present?
  reb = rebs.first
  readings << Reading.create!(reading: reb.content, primary: is_primary_reading, primary_kana: true, word_id: word.id)

  rebs[1..].each do |non_primary_reading|
    readings << Reading.create!(reading: non_primary_reading.content, primary: false, primary_kana: false, word_id: word.id)
  end

  entry.elements.search('../sense').each do |sense|
    definition_part_of_speech = sense.search('./pos').map(&:content).join(', ') if sense.search('./pos').present?
    definition_misc_info = sense.search('./misc').map(&:content).join(', ') if sense.search('./misc').present?
    definition_entry = sense.search('./gloss').map(&:content).join('; ')

    Definition.create!(definition: definition_entry,
                       part_of_speech: definition_part_of_speech,
                       misc_info: definition_misc_info, word_id: word.id)
  end

  count += 1
  # puts 'PROGRESS!!!' if (count % 50_000).zero?
  # exit if count == 100
end
