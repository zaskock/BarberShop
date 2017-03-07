class CreateContacts < ActiveRecord::Migration
	def change
		create_table :contacts do |t|
			t.text :name
			t.text :email
			t.text :phone
			t.text :fax
			t.text :time_from
			t.text :time_to
		end
	end
end
