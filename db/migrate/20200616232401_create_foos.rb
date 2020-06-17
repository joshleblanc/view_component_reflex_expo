class CreateFoos < ActiveRecord::Migration[6.0]
  def change
    create_table :foos do |t|

      t.timestamps
    end
  end
end
