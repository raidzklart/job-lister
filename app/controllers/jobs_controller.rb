class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.all
  end

  def show
    @categories = Category.all
    @job = Job.find(params[:id])
  end

  def new
    @categories = Category.all
    @job = Job.new
  end

  def create
    @categories = Category.all
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Your job was successfully added!"
      redirect_to root_url
    else
      flash.now[:danger] = "Make sure you've entered all required fields."
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      flash[:success] = "Your job was successfully destroyed!"
      redirect_to root_url
    else
      flash.now[:danger] = "We haven't been able to delete that job, please try again."
      render :job
    end
  end

  def edit
    @categories = Category.all
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "Your job was successfully edited!"
      redirect_to root_url
    else
      flash.now[:danger] = "Make sure you've entered all required fields."
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:company, :title, :description, :location, :salary, :contact_user, :contact_email, :category_id)
  end
end
