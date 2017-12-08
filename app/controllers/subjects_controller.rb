class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :student]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @students = Student.all
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if !params[:subjects_students].nil?
        SubjectStudent.create student_id: student_params[:student_id], subject_id: @subject.id

        format.html { redirect_to @subject, notice: 'Student was added' }
        format.json { render :show, status: :ok, location: @subject }
      else
        if @subject.update(subject_params)
          format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
          format.json { render :show, status: :ok, location: @subject }
        else
          format.html { render :edit }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def student
    student = SubjectStudent.find_by student_id: params[:student_id], subject_id: @subject.id
    student.destroy
    respond_to do |format|
      format.html { redirect_to edit_subject_url(@subject), notice: 'Student was removed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :teacher)
    end

    def student_params
      params.require(:subjects_students).permit(:student_id)
    end
end
