class AddFieldsToModels < ActiveRecord::Migration[8.0]
  def change
      change_table :airports do |t|
        t.string :name, null: false
        t.string :code, null: false
      end

      add_index :airports, :code, unique: true

    change_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :departure_time, null: false
      t.integer :duration_minutes, null: false
    end

    change_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
    end

    change_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :booking, null: false, foreign_key: true
    end
  end
end
