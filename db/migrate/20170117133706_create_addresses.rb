class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}, null: false
      t.string :name, null: false
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :website
      t.text :other

      t.timestamps
    end
  end
end
