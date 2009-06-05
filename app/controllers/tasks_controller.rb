class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @tasks.to_xml }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @task.to_xml }
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @priorities = Priority.find(:all)
    @quadrants = Quadrant.find(:all)
  end

  # GET /tasks/1;edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to task_url(@task) }
        format.xml  { head :created, :location => task_url(@task) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors.to_xml }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to task_url(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors.to_xml }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.xml  { head :ok }
    end
  end
end