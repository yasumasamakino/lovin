class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :name_sei, :string, null: false
    add_column :users, :name_mei, :string, null: false
    add_column :users, :name_sei_kana, :string, null: false
    add_column :users, :name_mei_kana, :string, null: false
    add_column :users, :sex, :char, null: false
  end
end
