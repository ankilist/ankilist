# frozen_string_literal: true

#reader = Nokogiri::XML::Reader(File.open("#{Rails.root}/JMdict_e"))
#counter = 0
#
#reader.each do |node|
#  puts node.name
#  puts "INNER: #{node.inner_xml}" if node.name == 'reb'
#  exit if counter > 20
#  counter += 1
#end

count = 0
doc = Nokogiri::XML(File.open("#{Rails.root}/JMdict_e"))

doc.search('//entry').each do |entry|
  primary_reading = nil
  readings = []
  # p entry.elements
  # Weird case on line 534
  kebs = entry.elements.search('./keb')
  if kebs.present?
    # pp kebs
    primary_reading = kebs.first
    readings << Reading.create!(reading: primary_reading.content, primary: true)

    kebs[1..].each do |non_primary_reading|
      readings << Reading.create!(reading: non_primary_reading.content, primary: false)
    end
  end

  # pp entry.elements.search('./reb')
  rebs = entry.elements.search('./reb')
  if primary_reading.nil? && rebs.present?
    reb = rebs.first
    readings << Reading.create!(reading: reb.content, primary: true)

    rebs[1..].each do |non_primary_reading|
      readings << Reading.create!(reading: non_primary_reading.content, primary: false)
    end
  else
    rebs.each do |non_primary_reading|
      readings << Reading.create!(reading: non_primary_reading.content, primary: false)
    end
  end

  # pp entry.elements.search('../sense')[3].search('./gloss').map(&:content).join('; ')
  entry.elements.search('../sense').each do |sense|
    definition_entry = sense.search('./gloss').map(&:content).join('; ')

    readings.each do |reading|
      Definition.create!(reading_id: reading.id, definition: definition_entry)
    end
  end

  count += 1
  puts "MILLIONS" if count % 1_000_000 == 0
  # exit if count == 100
end

# pp entry.method(:search).source_location
# pp entry.public_methods - Object.public_methods
