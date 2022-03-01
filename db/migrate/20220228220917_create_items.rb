# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :status, null: false
      t.string :register_number, null: false
      t.string :id_photo
      t.string :name, null: false
      t.string :description
      t.string :material
      t.string :reference_measures
      t.datetime :release_date
      t.datetime :publication_date
      t.string :conservation_state
      t.string :conservation_description
      t.string :recommendations
      t.string :general_observations
      t.string :cataloged_by
      t.string :last_change_by
      t.string :origin
      t.string :country
      t.string :donor_by
      t.datetime :donation_date
      t.string :localization

      t.timestamps
    end
  end
end
