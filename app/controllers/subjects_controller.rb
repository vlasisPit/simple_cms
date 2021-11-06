class SubjectsController < ApplicationController
=begin
  create a template with all subjects
  all subjects ordered by position
  You can specify the template here, but because it is called index you dont need
  to do it
=end
  def index
    @subjects = Subject.order('position ASC')
  end

  def show
    @subject = Subject.find(params[:id])
  end

=begin
  put values here to set some defaults
=end
  def new
    @subject = Subject.new
  end

=begin
  1) Instantiate a new object using form parameters
  2) Save the object
  3) If save succeeds, redirect to the index action
  4) If save fails, redisplay the form so user can fix the problems
=end
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :visible, :position)
  end
end
