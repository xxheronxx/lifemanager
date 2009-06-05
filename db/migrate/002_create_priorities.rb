class CreatePriorities < ActiveRecord::Migration
  def self.up
    create_table :priorities do |t|
      t.column :name, :string
    end
    
    Priority.create :name => "Vital"
    Priority.create :name => "Important"
    Priority.create :name => "Trivial"
    
  end

  def self.down
    drop_table :priorities
  end
end
