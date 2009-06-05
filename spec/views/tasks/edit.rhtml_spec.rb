require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tasks/edit.rhtml" do
  include TasksHelper
  
  before do
    @task = mock_model(Task)
    @task.stub!(:title).and_return("MyString")
    @task.stub!(:priority_id).and_return("1")
    @task.stub!(:order).and_return("1")
    @task.stub!(:quadrant_id).and_return("1")
    @task.stub!(:due_date).and_return(Date.today)
    @task.stub!(:created_at).and_return(Time.now)
    @task.stub!(:updated_at).and_return(Time.now)
    assigns[:task] = @task
  end

  it "should render edit form" do
    render "/tasks/edit.rhtml"
    
    response.should have_tag("form[action=#{task_path(@task)}][method=post]") do
      with_tag('input#task_title[name=?]', "task[title]")
      with_tag('input#task_order[name=?]', "task[order]")
    end
  end
end


