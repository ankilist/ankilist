class InitialReadingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.timestamps
    end

    create_table :readings do |t|
      t.string :reading
      t.boolean :primary, default: false
      t.boolean :primary_kana, default: false
      t.references :word
      # not sure this is useful but it will at least help us keep track of the
      # last time we generated the db
      t.timestamps
    end

    create_table :definitions do |t|
      t.string :definition
      t.string :part_of_speech
      t.string :misc_info
      t.references :word
      t.timestamps
    end
  end
end
