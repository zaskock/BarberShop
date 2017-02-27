class CreateBarbers < ActiveRecord::Migration
	def change
	
		create_table :barbers do |t|
		t.text :name
#creates fields 'created_at' & 'ipdated_at' in the table
		t.timestamps
		end
	
	Barber.create :name => 'Jessie White'
	Barber.create :name => 'Walter Pinkman'
	Barber.create :name => 'Gus Sugg'
	
	end
end
