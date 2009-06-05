class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :quadrant
  
  validates_presence_of :title, :priority_id
  
  def has_tasks_before?
    true
  end
  
  def has_tasks_after?
    true
  end
end
