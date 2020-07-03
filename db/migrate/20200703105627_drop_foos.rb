class DropFoos < ActiveRecord::Migration[6.0]
  def change
    drop_table :foos
  end
end
