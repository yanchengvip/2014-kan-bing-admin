class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :hospital_id,:limit => 8
      t.integer :department_id,:limit => 8
      t.string :introduction
      t.timestamps
    end
  end
end
