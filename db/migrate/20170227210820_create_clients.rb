class CreateClients < ActiveRecord::Migration
	def change

		create_table :client do |t|
		t.text :name
		t.text :phone
		t.text :datestamp
		t.text :barber
		t.text :color
#creates fields 'created_at' & 'ipdated_at' in the table
		t.timestamps
		end

	end
end