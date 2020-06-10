class InitialReadingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.string :reading
      t.boolean :primary
      # not sure this is useful but it will at least help us keep track of the
      # last time we generated the db
      t.timestamps
    end

    create_table :definitions do |t|
      t.string :definition
      t.references :reading
      t.timestamps
    end
  end
end
