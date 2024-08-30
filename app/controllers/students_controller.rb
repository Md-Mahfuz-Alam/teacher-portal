class StudentsController < ApplicationController
  def new
    @student = Student.new
    respond_to do |format|
      format.js
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to user_path(@current_user), notice: 'Student was successfully updated.'
    else
      render :edit
    end    
  end

  def create_edit
    @student = Student.find_by(name: params[:student][:name], subject: params[:student][:subject])
    if @student
      @student.marks += params[:student][:marks].to_i
      @student.save
      redirect_to user_path(@current_user), notice: 'Student was successfully edited.'
    else
      @student = Student.new(student_params)
      @student.user_id = params[:id]
      @student.save
      redirect_to user_path(@current_user), notice: 'Student was successfully created.'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to user_path(@current_user), notice: 'Student was successfully deleted.'
  end

  private

  def student_params
    params.require(:student).permit(:name, :subject, :marks, :id)
  end
end
