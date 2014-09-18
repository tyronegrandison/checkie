class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :site_address
      t.string :site_city
      t.string :site_zip
      t.string :site_state
      t.string :naics_code
      t.string :insp_type
      t.datetime :open_date
      t.float :total_current_penalty
      t.boolean :osha_violation_indicator
      t.integer :serious_violations
      t.integer :total_violations
      t.datetime :loaded_at

      t.timestamps
    end
  end
end
