class SorceryCore < ActiveRecord::Migration
  def change

    add_column :users, :email, :string,           :null => false
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    # create_table :users do |t|
    #   t.string :email,            :null => false
    #   t.string :crypted_password
    #   t.string :salt

    #   t.timestamps
    # end

    add_index :users, :email, unique: true
  end
end