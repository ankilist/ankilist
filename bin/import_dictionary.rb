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

doc = Nokogiri::XML(File.open("#{Rails.root}/JMdict_e"))

entry = doc.search('//entry')[8]

p entry.elements
# Weird case on line 534
pp entry.elements.search('./keb')
pp entry.elements.search('./reb')
pp entry.elements.search('../sense')[3].search('./gloss').map(&:content).join('; ')
# pp entry.method(:search).source_location
# pp entry.public_methods - Object.public_methods
