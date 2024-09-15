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
    if current_user == @student.user_id
      if @student.update(student_params)
        redirect_to user_path(@current_user), notice: 'Student was successfully updated.'
      else
        render :edit
      end  
    else
      redirect_to user_path(@current_user), notice: 'You are not authorized .'
    end  
  end

  def create_edit
    @student = Student.find_or_create_by(name: params[:student][:name])
    if @student.new_record?
      @student.user_id = @current_user.id
      @student.save
    end
    @student_detail = @student.student_details.find_or_initialize_by(subject: params[:student][:subject])
  
    if @student_detail.persisted?
      @student_detail.marks += params[:student][:marks].to_i
    else
      @student_detail.marks = params[:student][:marks]
      @student_detail.subject = params[:student][:subject]
    end
  
    @student_detail.student_id = @student.id
    @student_detail.save
  
    redirect_to user_path(@current_user), notice: "Student has been saved"
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
