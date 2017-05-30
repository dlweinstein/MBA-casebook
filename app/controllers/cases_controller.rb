class CasesController < ApplicationController
  def index
    @cases = Case.all

    render("cases/index.html.erb")
  end

  def top_cases
  @cases=Case.all.sort_by do |the_case|
    the_case.favorites.count
  end.take(3)
    render("cases/top_cases.html.erb")
  end


  def show
    @case = Case.find(params[:id])

    render("cases/show.html.erb")
  end

  def new
    @case = Case.new

    render("cases/new.html.erb")
  end

  def create
    @case = Case.new

    @case.case_type = params[:case_type]
    @case.interviewer_led = params[:interviewer_led]
    @case.industry = params[:industry]
    @case.page = params[:page]
    @case.user_id = params[:user_id]
    @case.name = params[:name]
    @case.quant = params[:quant]
    @case.structure = params[:structure]

    save_status = @case.save

    if save_status == true
      redirect_to("/cases/#{@case.id}", :notice => "Case created successfully.")
    else
      render("cases/new.html.erb")
    end
  end

  def edit
    @case = Case.find(params[:id])

    render("cases/edit.html.erb")
  end

  def update
    @case = Case.find(params[:id])

    @case.case_type = params[:case_type]
    @case.interviewer_led = params[:interviewer_led]
    @case.industry = params[:industry]
    @case.page = params[:page]
    @case.user_id = params[:user_id]
    @case.name = params[:name]
    @case.quant = params[:quant]
    @case.structure = params[:structure]

    save_status = @case.save

    if save_status == true
      redirect_to("/cases/#{@case.id}", :notice => "Case updated successfully.")
    else
      render("cases/edit.html.erb")
    end
  end

  def destroy
    @case = Case.find(params[:id])

    @case.destroy

    if URI(request.referer).path == "/cases/#{@case.id}"
      redirect_to("/", :notice => "Case deleted.")
    else
      redirect_to(:back, :notice => "Case deleted.")
    end
  end
end
