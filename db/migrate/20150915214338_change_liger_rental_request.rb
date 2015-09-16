class ChangeLigerRentalRequest < ActiveRecord::Migration
  def change
    change_column :liger_rental_requests, :status, :string, default: 'PENDING'
  end
end
