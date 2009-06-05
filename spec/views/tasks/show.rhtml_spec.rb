require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tasks/show.rhtml" do
  include TasksHelper
  
  before(:each) do
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

  it "should render attributes in <p>" do
    render "/tasks/show.rhtml"
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

