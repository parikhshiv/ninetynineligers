class CreateLigerRentalRequest < ActiveRecord::Migration
  def change
    create_table :liger_rental_requests do |t|
      t.integer :liger_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.integer :status, default: "PENDING"

    end
    add_index :liger_rental_requests, :liger_id
  end
end
