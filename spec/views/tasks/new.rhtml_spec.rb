require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tasks/new.rhtml" do
  include TasksHelper
  
  before(:each) do
    @task = mock_model(Task)
    @task.stub!(:new_record?).and_return(true)
    @task.stub!(:title).and_return("MyString")
    @task.stub!(:priority_id).and_return("1")
    @task.stub!(:order).and_return("1")
    @task.stub!(:quadrant_id).and_return("1")
    @task.stub!(:due_date).and_return(Date.today)
    @task.stub!(:created_at).and_return(Time.now)
    @task.stub!(:updated_at).and_return(Time.now)
    assigns[:task] = @task
  end

  it "should render new form" do
    render "/tasks/new.rhtml"
    
    response.should have_tag("form[action=?][method=post]", tasks_path) do
      with_tag("input#task_title[name=?]", "task[title]")
      with_tag("input#task_order[name=?]", "task[order]")
    end
  end
end


