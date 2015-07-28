class AddPeopleToServices < ActiveRecord::Migration
  def change
    add_reference :services, :customer, index: true
    add_reference :services, :driver, index: true
  end
end
