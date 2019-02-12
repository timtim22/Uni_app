class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update]
    skip_before_action :require_user, only: [:new, :create]
    before_action :require_same_user, only:[:edit, :update ]

    def index
        @students = Student.all
    end

    def show
        
    end

    def new
        @student = Student.new
    end

    def edit
        
    end

    def update
        
        if @student.update(student_params)
            flash[:notice] = "You have successfully update the profile"
            redirect_to @student
        else
            render 'edit'
        end
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:success] = "You have successfully Signed Up"
            redirect_to @student
        else
            render 'new'
        end
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_user
        if current_user != @student
            flash[:notice] = "You can only edit your own Profile."
            redirect_to student_path(current_user)
        end
    end
end