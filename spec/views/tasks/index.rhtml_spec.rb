require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tasks/index.rhtml" do
  include TasksHelper
  
  before(:each) do
    task_98 = mock_model(Task)
    task_98.should_receive(:title).and_return("MyString")
    task_98.should_receive(:priority_id).and_return("1")
    task_98.should_receive(:order).and_return("1")
    task_98.should_receive(:quadrant_id).and_return("1")
    task_98.should_receive(:due_date).and_return(Date.today)
    task_98.should_receive(:created_at).and_return(Time.now)
    task_98.should_receive(:updated_at).and_return(Time.now)
    task_99 = mock_model(Task)
    task_99.should_receive(:title).and_return("MyString")
    task_99.should_receive(:priority_id).and_return("1")
    task_99.should_receive(:order).and_return("1")
    task_99.should_receive(:quadrant_id).and_return("1")
    task_99.should_receive(:due_date).and_return(Date.today)
    task_99.should_receive(:created_at).and_return(Time.now)
    task_99.should_receive(:updated_at).and_return(Time.now)

    assigns[:tasks] = [task_98, task_99]
  end

  it "should render list of tasks" do
    render "/tasks/index.rhtml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

