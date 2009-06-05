class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.column :title, :string
      t.column :priority_id, :integer
      t.column :order, :integer
      t.column :quadrant_id, :integer
      t.column :due_date, :date
      t.column :created_at, :timestamp
      t.column :updateed_at, :timestamp
    end
    
  end

  def self.down
    drop_table :tasks
  end
end
