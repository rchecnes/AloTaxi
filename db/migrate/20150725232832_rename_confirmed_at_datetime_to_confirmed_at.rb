class RenameConfirmedAtDatetimeToConfirmedAt < ActiveRecord::Migration
  
  def change
    
    remove_column(:services, :confirmed_at_datetime)
     add_column :services, :confirmed_at, :datetime
  end
end
