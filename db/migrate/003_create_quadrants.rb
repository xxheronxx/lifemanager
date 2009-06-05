class CreateQuadrants < ActiveRecord::Migration
  def self.up
    create_table :quadrants do |t|
      t.column :name, :string
    end
    
    Quadrant.create :name => "Unimportant/Non-urgent"
    Quadrant.create :name => "Unimportant/Urgent"
    Quadrant.create :name => "Important/Non-urgent"
    Quadrant.create :name => "Important/Urgent"
  end

  def self.down
    drop_table :quadrants
  end
end
