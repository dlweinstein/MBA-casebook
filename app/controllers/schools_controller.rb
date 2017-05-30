class SchoolsController < ApplicationController
  def index
    @schools = School.all

    render("schools/index.html.erb")
  end

  def show
    @school = School.find(params[:id])

    render("schools/show.html.erb")
  end

  def new
    @school = School.new

    render("schools/new.html.erb")
  end

  def create
    @school = School.new

    @school.name = params[:name]

    save_status = @school.save

    if save_status == true
      redirect_to("/schools/#{@school.id}", :notice => "School created successfully.")
    else
      render("schools/new.html.erb")
    end
  end

  def edit
    @school = School.find(params[:id])

    render("schools/edit.html.erb")
  end

  def update
    @school = School.find(params[:id])

    @school.name = params[:name]

    save_status = @school.save

    if save_status == true
      redirect_to("/schools/#{@school.id}", :notice => "School updated successfully.")
    else
      render("schools/edit.html.erb")
    end
  end

  def destroy
    @school = School.find(params[:id])

    @school.destroy

    if URI(request.referer).path == "/schools/#{@school.id}"
      redirect_to("/", :notice => "School deleted.")
    else
      redirect_to(:back, :notice => "School deleted.")
    end
  end
end
