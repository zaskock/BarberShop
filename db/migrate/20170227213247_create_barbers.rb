class CreateBarbers < ActiveRecord::Migration
	def change
	
		create_table :barbers do |t|
			t.text :name
#creates fields 'created_at' & 'updated_at' in the table
			t.timestamps
		end

		Barber.create :name => 'Jessie White'
		Barber.create :name => 'Walter Pinkman'
		Barber.create :name => 'Gustavo Fring'
		Barber.create :name => 'Mike Ehrmantraut'
		Barber.create :name => 'Marie Schrader'

	end
end
