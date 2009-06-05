require File.dirname(__FILE__) + '/../spec_helper'

describe Task do
  before(:each) do
    @task = Task.new(valid_task_hash) # grabs the hash below
  end

  it "should be valid" do
    @task.should be_valid
  end
  
  it "should not be valid without a title" do
    @task.title = nil
    @task.should_not be_valid
  end
  
  it "should not be valid without a priority id" do
    @task.priority_id = nil
    @task.should_not be_valid
  end
  
  it "should know if there is a task ahead of it" do
    @task.has_tasks_before? == true
    @task.should be_valid
    @task.has_tasks_before? == false
    @task.should be_valid 
  end
  
  it "should know if there is a task behind it" do
    @task.has_tasks_after? == true
    @task.should be_valid
    @task.has_tasks_after? == false
    @task.should be_valid
  end
  
  def valid_task_hash
    { :title => 'my really cool task',
      :priority_id => '1'}
  end
  
end
